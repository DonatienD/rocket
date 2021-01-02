require 'test_helper'

class MissionsControllerTest < ActionDispatch::IntegrationTest
  test "Student should be able to update its own mission" do
    sign_in users(:student)
    student_mission = missions(:history_mission)

    patch mission_url(student_mission), params: { mission: { name: "updated" } }

    assert_redirected_to mission_path(student_mission)
    # Reload association to fetch updated data and assert that name is updated.
    student_mission.reload
    assert_equal "updated", student_mission.name
  end

  test "Teacher should be able to update its own mission" do
    sign_in users(:teacher)
    teacher_mission = missions(:french_mission)

    patch mission_url(teacher_mission), params: { mission: { name: "updated" } }

    assert_redirected_to mission_path(teacher_mission)
    # Reload association to fetch updated data and assert that name is updated.
    teacher_mission.reload
    assert_equal "updated", teacher_mission.name
  end

  test "Student should not be able to update teacher mission" do
    sign_in users(:student)
    teacher_mission = missions(:french_mission)


    patch mission_url(teacher_mission), params: { mission: { name: "updated" } }

    # assert_redirected_to mission_path(student_mission)
    # Reload association to fetch updated data and assert that name is updated.
    teacher_mission.reload
    assert_equal "Rimbaud and Romantism", teacher_mission.name
  end

  test "Teacher should not be able to update student mission" do
    sign_in users(:teacher)
    student_mission = missions(:history_mission)

    patch mission_url(student_mission), params: { mission: { name: "updated" } }

    # assert_redirected_to mission_path(student_mission)
    # Reload association to fetch updated data and assert that name is updated.
    student_mission.reload
    assert_equal "The Lumieres", student_mission.name
  end
end
