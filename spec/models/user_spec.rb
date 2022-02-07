# frozen_string_literal: true

require 'spec_helper'

describe User, type: :model do
  context 'user validation test' do
    it 'user name must exist' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'cannot save without a user name' do
      user = build(:user, name: nil)
      expect(user).to_not be_valid
    end

    it 'cannot have two users with the same name' do
      create(:user, name: 'John')
      user2 = build(:user, name: 'John')
      expect(user2).to_not be_valid
    end
  end
end
