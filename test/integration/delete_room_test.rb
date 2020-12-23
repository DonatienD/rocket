require 'test_helper'

class DeleteRoomFlowTest < ActionDispatch::IntegrationTest

  test "Teacher should be able to delete a room he created" do
    sign_in users(:teacher)

    @room = rooms(:teacher_room)

    assert_difference 'Room.count', -1, "Room was not deleted" do
      delete "/rooms/#{rooms(:teacher_room).id}"
    end

    assert_not Room.all.include?(@room), "Room was not deleted"
  end

  test "User should not be able to delete a room he did not create" do
    # Student shouldn't delete teacher's room
    sign_in users(:student)

    @teacher_room = rooms(:teacher_room)

    assert_no_difference 'Room.count', "Teacher room was deleted by student" do
      delete "/rooms/#{rooms(:teacher_room).id}"
    end

    assert Room.all.include?(@teacher_room), "Teacher room was deleted by student"

    sign_out :student

    # Teacher shouldn't delete student's room
    sign_in users(:teacher)

    @student_room = rooms(:student_room)

    assert_no_difference 'Room.count', "Student room was deleted by Teacher" do
      delete "/rooms/#{rooms(:student_room).id}"
    end

    assert Room.all.include?(@student_room), "Student room was deleted by Teacher"
  end

end
