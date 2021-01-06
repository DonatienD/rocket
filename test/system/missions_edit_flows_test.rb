require "application_system_test_case"

class MissionsEditFlowsTest < ApplicationSystemTestCase
  test "Student should be able to update its own mission" do
    sign_in users(:student)
    @mission = missions(:history_mission)

    visit mission_path(@mission)

    click_on "Options"
    click_on 'Editer la mission'

    fill_in "mission_name", with: "Updated name"
    click_on "Enregistrer"

    assert_selector "h1", text: "Updated name"
  end

  test "Teacher should be able to update its own mission" do
    sign_in users(:teacher)
    @mission = missions(:french_mission)

    visit mission_path(@mission)

    click_on "Options"
    click_on 'Editer la mission'

    fill_in "mission_name", with: "Updated name"
    click_on "Enregistrer"

    assert_selector "h1", text: "Updated name"
  end

  test "Student should not be able to update teacher mission" do
    sign_in users(:student)
    @mission = missions(:french_mission)

    visit mission_path(@mission)

    assert_raise do
      click_on "Options"
    end
  end

  test "Teacher should be able to update student mission" do
    sign_in users(:teacher)
    @mission = missions(:history_mission)

    visit mission_path(@mission)

    assert_raise do
      click_on "Options"
    end
  end

end
