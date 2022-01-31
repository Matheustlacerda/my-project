require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'user must have a name' do
    user = User.new(name:'Jane', age:30)
    assert user.valid?
  end

  test 'invalide user name' do
    user = User.new(age:30)
    refute user.valid?, 'user is valid without a name'
    assert_not_nil user.errors[:name], 'no validation error for name present'
  end
end
