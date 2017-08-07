require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should allow setting name" do 
    a = User.new
    a.name = "Adam"
    assert_equal "Adam", a.name
  end

  test "should not save without an email" do 
    a = User.new
    assert_noy a.save
    assert_equal ["can't be blank"], a.errors[:email]
  end
