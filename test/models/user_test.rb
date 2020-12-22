require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "count users" do
    assert_equal 2, users.count, "Users count different from 2"
  end

  test "teacher is false for student" do
    assert_not users(:student).teacher, "Student is recognized as teacher"
  end

  test "teacher is true for teacher" do
    assert users(:teacher).teacher, "Teacher is not recognized as so"
  end

end
