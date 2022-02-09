# frozen_string_literal: true

require 'spec_helper'

describe User, type: :model do
  describe 'validations' do
    let(:user) { build :user }

    it { expect(user).to be_valid }

    context 'when the name is empty' do
      before { user.name = nil }

      it { expect(user).to_not be_valid }
    end

    context 'when two users have the same name' do
      before { create :user, name: user.name }

      it { expect(user).to_not be_valid }
    end
  end
end
