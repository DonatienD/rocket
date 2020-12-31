require "application_system_test_case"

class DeleteRoomFlowsTest < ApplicationSystemTestCase

  test "Deleting a room as a teacher" do
    sign_in users(:teacher)

    @room = rooms(:teacher_room)

    visit room_path(@room)

    click_on "Options"

    accept_alert do
      click_link('Supprimer la classe')
    end

    # assert_redirected_to dashboard_path

    # save_and_open_screenshot

    # Cannot pass last assertion without doing an action before #weird
    # So, let's click on Dashboard, which we're already on
    click_on "Tableau de bord"

    assert_not Room.all.include?(@room), "Room was not deleted"
  end

  test "Deleting a room as a student" do
    sign_in users(:student)

    @room = rooms(:student_room)

    visit room_path(@room)

    click_on "Options"

    accept_alert do
      click_link('Supprimer la matière')
    end

    # Cannot pass last assertion without doing an action before #weird
    # So, let's click on Dashboard, which we're already on
    click_on "Tableau de bord"

    assert_not Room.all.include?(@room), "Room was not deleted"
  end
end
