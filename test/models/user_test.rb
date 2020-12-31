require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "teacher is false for student" do
    assert_not users(:student).teacher, "Student is recognized as teacher"
  end

  test "teacher is true for teacher" do
    assert users(:teacher).teacher, "Teacher is not recognized as so"
  end

end
