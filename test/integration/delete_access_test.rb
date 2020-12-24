require 'test_helper'

class DeleteAccessTest < ActionDispatch::IntegrationTest

  test "Student should be able to delete an access he created to teacher room" do
    sign_in users(:student)

    @student_access = accesses(:student_access_to_teacher_room)

    assert_difference 'Access.count', -1, "Access was not deleted" do
      delete "/accesses/#{@student_access.id}"
    end

    assert_not Access.all.include?(@student_access), "Access was not deleted"
  end

  test "Student shouldn't be able to delete an access to it's own room" do
    sign_in users(:student)

    @student_access = accesses(:student_access)

    assert_no_difference 'Access.count', "Access not deleted" do
      delete "/accesses/#{@student_access.id}"
    end

    assert Access.all.include?(@student_access), "Access not deleted"
  end

  test "Teacher should not be able to delete an access to its own room" do
    sign_in users(:teacher)

    @teacher_access = accesses(:teacher_access)

    assert_no_difference 'Access.count', "Access was deleted" do
      delete "/accesses/#{@teacher_access.id}"
    end

    assert Access.all.include?(@teacher_access), "Access was deleted"
  end

  test "Teacher should not be able to delete a student access" do
    sign_in users(:teacher)

    @student_access = accesses(:student_access_to_teacher_room)

    assert_no_difference 'Access.count', "Access was deleted" do
      delete "/accesses/#{@student_access.id}"
    end

    assert Access.all.include?(@student_access), "Access was deleted"
  end
end
