require 'test_helper'

class NewUserTest < ActionDispatch::IntegrationTest

  test "Signing up as a student" do
    # Should be able to create an account
    get "/users/sign_up"
    assert_response :success, "Cannot access sign up page"
    assert_difference 'User.count' do
      # Should be able to create a new access
      post "/users", params: { user: { email: "student_create_test@rocket.com", password: "testpassword", password_confirmation: "testpassword" } }
    end

    assert User.last.valid?, "Created user is not valid"
    assert_not User.last.teacher, "Student has 'teacher: true'"

    assert_redirected_to new_profile_path, "Is not redirected after signin up"

    follow_redirect!

    assert_difference 'Profile.count' do
      # Should be able to create a new access
      post "/profiles", params: { profile: { gender: "Mr", first_name: "Jean", last_name: "Paul" } }
    end

    assert_redirected_to dashboard_path, "Is not redirected to dashboard after creating profile"

    sign_out :user

    # Should not be able to create a duplicate account
    get "/users/sign_up"
    assert_response :success, "Cannot access sign up page"
    assert_no_difference 'User.count', "Duplicate account was created" do
      # Should be able to create a new access
      post "/users", params: { user: { email: "student_create_test@rocket.com", password: "testpassword", password_confirmation: "testpassword" } }
    end
  end

  test "Signing up as a teacher" do
    # Should be able to create an account
    get "/users/sign_up"
    assert_response :success, "Cannot access sign up page"
    assert_difference 'User.count' do
      # Should be able to create a new access
      post "/users", params: { user: { email: "teacher_create_test@rocket.com", password: "testpassword", password_confirmation: "testpassword", teacher: true } }
    end

    assert User.last.valid?, "Created user is not valid"
    assert User.last.teacher, "Teacher has 'teacher: false'"

    assert_redirected_to new_profile_path, "Is not redirected after signin up"

    follow_redirect!

    assert_difference 'Profile.count' do
      # Should be able to create a new access
      post "/profiles", params: { profile: { gender: "Mme", first_name: "Jeanne", last_name: "Blanc" } }
    end

    assert_redirected_to new_subject_path, "Teacher is not redirected to subject creation after creating profile"

    sign_out :user

    # Should not be able to create a duplicate account
    get "/users/sign_up"
    assert_response :success, "Cannot access sign up page"
    assert_no_difference 'User.count', "Duplicate account was created" do
      # Should be able to create a new access
      post "/users", params: { user: { email: "teacher_create_test@rocket.com", password: "testpassword", password_confirmation: "testpassword", teacher: true } }
    end
  end

end
