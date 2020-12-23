require 'test_helper'

class NewAccessFlowTest < ActionDispatch::IntegrationTest

  test "student can create an access" do
    sign_in users(:student)

    # Should be able to access accesses/new page
    get "/accesses/new"
    assert_response :success, "Cannot access /accesses/new"

    # Should be able to create a new access
    post "/accesses",
    params: { access: { room_id: rooms(:teacher_room_without_student_access).id } }
    assert_response :redirect, "Is not redirected after creating a new access"
    follow_redirect!
    assert_response :success
    assert_select "li", rooms(:teacher_room_without_student_access).subject.name, "New access does not appear on page"

    # Should not be able to create a dublicate access
    assert_no_difference 'accesses.count', 'A duplicate access should not be created' do
      post "/accesses",
      params: { access: { room_id: rooms(:teacher_room_without_student_access).id } }
    end
    assert_response :redirect, "Is not redirected when trying to create a duplicate access"
  end

  test "teacher cannot manually create an access" do
    sign_in users(:teacher)

    # Should be able to access accesses/new page
    get "/accesses/new"
    assert_response :redirect, "Teacher can access /accesses/new"

    # Should not be able to post an access
    @room = Room.create(level: "3e", subject: subjects(:teacher_subject), user: users(:teacher))
    assert_no_difference 'accesses.count', 'Teacher can create an access via post request' do
      post "/accesses",
      params: { access: { room_id: @room.id } }
    end
    assert_response :redirect, "Teacher is not redirected when trying to manually create an access"
  end

end
