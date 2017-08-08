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

  test "should allow setting password" do
    a = User.new name: "Adam"
    a.password = "asdf"
    assert_equal "asdf", a.password
  end

  test "should not save without an email" do 
    a = User.new
    assert_not a.save
    assert_equal ["can't be blank"], a.errors[:email]    
  end

  test "should not save without a password" do
    a = User.create name: "Adam", email: "a@example.com"
    assert_equal ["can't be blank"], a.errors[:password]
  end

  test "should save with a password but without confirmation" do
    a = User.create name:"Adam", email: "a@example.com", password: "asdf"
    assert a.save
  end  

  test "should not save with incorrect password_confirmation" do
    a = User.new name: "Adam", email: "a@example.com"
    a.password = "asdf"
    a.password_confirmation = "asdf"
    assert  a.save
  end
  
  test "authenticate should return true if password matches" do 
    a = User.create! name: "Adam", email: "a@example.com", password: "asdf"
    assert a.save
    assert_not a.authenticate("something")
    assert a.authenticate("asdf")
  end
end    