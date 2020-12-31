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

    assert_difference 'Profile.count' do
      choose "Mr"

      fill_in "Nom", with: "Jean"
      # save_and_open_screenshot
      fill_in "Prénom", with: 'Paul'
      # save_and_open_screenshot

      click_on "Créer mon profil"
      # save_and_open_screenshot
    end

    assert Profile.last.valid?, "Created profile is not valid"

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

    assert_difference 'Profile.count' do
      choose "Mme"

      fill_in "Nom", with: "Jeanne"
      # save_and_open_screenshot
      fill_in "Prénom", with: 'Blanc'
      # save_and_open_screenshot

      click_on "Créer mon profil"
      # save_and_open_screenshot
    end

    assert Profile.last.valid?, "Created profile is not valid"

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
