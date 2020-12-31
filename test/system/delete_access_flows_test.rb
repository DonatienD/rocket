require "application_system_test_case"

class DeleteAccessFlowsTest < ApplicationSystemTestCase

  test "Student should be able to delete an access he created to teacher room" do
    sign_in users(:student)

    @room = rooms(:teacher_room)
    @student_access = accesses(:student_access_to_teacher_room)

    visit room_path(@room)
    # assert_response :success

    click_on "Options"

    accept_alert do
      click_link('Quitter la classe')
    end

    # Cannot pass last assertion without doing an action before #weird
    # So, let's click on Dashboard, which we're already on
    click_on "Tableau de bord"

    assert_not Access.all.include?(@student_access), "Access was not deleted"
  end

  test "Student should not be able to delete an access to its own room" do
    sign_in users(:student)

    @room = rooms(:student_room)
    @student_access = accesses(:student_access)

    visit room_path(@room)

    click_on "Options"

    assert_raise do
      click_link('Quitter la classe')
    end

    assert Access.all.include?(@student_access), "Access was not deleted"
  end

  test "Teacher should not be able to delete an access to its own room" do
    sign_in users(:teacher)

    @room = rooms(:teacher_room)
    @teacher_access = accesses(:teacher_access)

    visit room_path(@room)

    click_on "Options"

    assert_raise do
      click_link('Quitter la classe')
    end

    assert Access.all.include?(@teacher_access), "Access was not deleted"
  end

  test "Teacher should not be able to delete an student access" do
    sign_in users(:teacher)

    @room = rooms(:teacher_room)
    @teacher_access = accesses(:student_access_to_teacher_room)

    visit room_path(@room)

    click_on "Options"

    assert_raise do
      click_link('Quitter la classe')
    end

    assert Access.all.include?(@teacher_access), "Access was not deleted"
  end
end
