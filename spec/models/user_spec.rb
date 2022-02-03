# frozen_string_literal: true

require 'spec_helper'

describe User, type: :model do
  context 'user validation test' do
    it 'user name must exist' do
      user = User.new(name: 'Jane', age: 30)
      expect(user.valid?).to eq(true)
    end

    it 'must have a user name' do
      user = User.new(age: 30)
      expect(user.valid?).to eq(false)
    end

    it 'cannot have two users with the same name' do
      user_1 = User.create(name: 'Jane', age: 30)
      user_2 = User.create(name: 'Jane', age: 29)
      expect(user_1.valid?).to eq(true)
      expect(user_2.valid?).to eq(false)
    end
  end
end
