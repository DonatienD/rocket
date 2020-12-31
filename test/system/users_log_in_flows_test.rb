require "application_system_test_case"

class UsersLogInFlowsTest < ApplicationSystemTestCase

  test "Should be able to access dashboard as a student when logging in if profile exists" do
    # Logging in as a Student
    visit root_path

    click_on "Accéder à Rocket"

    fill_in "user_email", with: "student_test@rocket.com"
    # save_and_open_screenshot
    fill_in "user_password", with: 'password'
    # save_and_open_screenshot
    click_on "Connexion"
    # save_and_open_screenshot
  end

  test "Should be able to access dashboard as a teacher when logging in if profile exists" do
    # Logging in as a Teacher
    visit root_path

    click_on "Accéder à Rocket"

    fill_in "user_email", with: "teacher_test@rocket.com"
    # save_and_open_screenshot
    fill_in "user_password", with: 'password'
    click_on "Connexion"
  end

  test "Student should be redirected to '/profiles/new' when logging in if profile does not exist" do
    # Logging in as a Student
    visit root_path

    click_on "Accéder à Rocket"

    fill_in "user_email", with: "student_test_no_profile@rocket.com"
    # save_and_open_screenshot
    fill_in "user_password", with: 'password'
    click_on "Connexion"

    # assert_select "h2", "Apprenons à nous connaître...", "Seems not to be redirected to dashboard after log in"

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

    # visit dashboard_path
    # assert_select "a", "Tableau de bord", "Seems not to be redirected to dashboard after creating profile"
  end

  test "Teacher should be redirected to '/profiles/new' when logging in if profile does not exist" do
    # Logging in as a Student
    visit root_path

    click_on "Accéder à Rocket"

    fill_in "user_email", with: "teacher_test_no_profile@rocket.com"
    # save_and_open_screenshot
    fill_in "user_password", with: 'password'
    click_on "Connexion"

    # assert_select "h2", "Apprenons à nous connaître...", "Seems not to be redirected to dashboard after log in"

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

    # visit dashboard_path
    # assert_select "a", "Tableau de bord", "Seems not to be redirected to dashboard after creating profile"
  end
end
