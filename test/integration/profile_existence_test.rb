require 'test_helper'

class ProfileExistenceTest < ActionDispatch::IntegrationTest

  # test "Should be able to access dashboard when logging in if profile exists" do
  #   get "/users/sign_in"
  #   sign_in users(:student)
  #   post user_session_url

  #   assert_redirected_to dashboard_path, "Student not redirected to dashboard after logging in"
  #   follow_redirect!

  #   sign_out :user

  #   get "/users/sign_in"
  #   sign_in users(:teacher)
  #   post user_session_url


  #   assert_redirected_to dashboard_path, "Teacher not redirected to dashboard after logging in"
  #   follow_redirect!
  # end

  # test "Should be redirected to '/profiles/new' when logging in if profile does not exist" do
  #   get "/users/sign_in"
  #   sign_in users(:student_without_profile)
  #   post user_session_url


  #   assert_redirected_to new_profile_path, "Student not redirected to 'profiles/new' after logging in"
  #   follow_redirect!

  #   sign_out :user

  #   get "/users/sign_in"
  #   sign_in users(:teacher_without_profile)
  #   post user_session_url


  #   assert_redirected_to new_profile_path, "Teacher not redirected to 'profiles/new' after logging in"
  #   follow_redirect!
  # end
end

