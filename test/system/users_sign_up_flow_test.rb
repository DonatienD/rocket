require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

  test "signing up as a student" do
    # Should be able to create an account
    assert_difference 'User.count' do
      visit new_user_session_path

      click_on "Créez-vous un compte"

      choose "Un étudiant"
      # save_and_open_screenshot
      fill_in "user_email", with: "student_create_test@rocket.com"
      # save_and_open_screenshot
      fill_in "user_password", with: 'testpassword'
      # save_and_open_screenshot
      fill_in "user_password_confirmation", with: 'testpassword'
      # save_and_open_screenshot

      click_on "Créer mon compte"
      # save_and_open_screenshot
    end

    assert User.last.valid?, "Created user is not valid"
    assert_not User.last.teacher, "Student has 'teacher: true'"
    sign_out :user

    # Should not be able to create a duplicate account
    assert_no_difference 'User.count' do
      visit new_user_session_path

      click_on "Créez-vous un compte"

      choose "Un étudiant"
      # save_and_open_screenshot
      fill_in "user_email", with: "student_create_test@rocket.com"
      # save_and_open_screenshot
      fill_in "user_password", with: 'testpassword'
      # save_and_open_screenshot
      fill_in "user_password_confirmation", with: 'testpassword'
      # save_and_open_screenshot

      click_on "Créer mon compte"
      # save_and_open_screenshot
    end
  end

  test "signing up as a teacher" do
    # Should be able to create an account
    assert_difference 'User.count' do
      visit new_user_session_path

      click_on "Créez-vous un compte"

      choose "Un professeur"
      # save_and_open_screenshot
      fill_in "user_email", with: "teacher_create_test@rocket.com"
      # save_and_open_screenshot
      fill_in "user_password", with: 'testpassword'
      # save_and_open_screenshot
      fill_in "user_password_confirmation", with: 'testpassword'
      # save_and_open_screenshot

      click_on "Créer mon compte"
      # save_and_open_screenshot
    end

    assert User.last.valid?, "Created user is not valid"
    assert User.last.teacher, "Teacher has 'teacher: false'"
    sign_out :user

    # Should not be able to create a duplicate account
    assert_no_difference 'User.count' do
      visit new_user_session_path

      click_on "Créez-vous un compte"

      choose "Un professeur"
      # save_and_open_screenshot
      fill_in "user_email", with: "teacher_create_test@rocket.com"
      # save_and_open_screenshot
      fill_in "user_password", with: 'testpassword'
      # save_and_open_screenshot
      fill_in "user_password_confirmation", with: 'testpassword'
      # save_and_open_screenshot

      click_on "Créer mon compte"
      # save_and_open_screenshot
    end
  end

end
