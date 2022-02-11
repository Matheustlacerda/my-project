# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  describe 'validations' do
    let(:phone_number) { build :phone_number }

    it { expect(phone_number).to be_valid }

    context 'when the number is empty' do
      before { phone_number.number = nil }

      it { expect(phone_number).to_not be_valid }
    end

    context 'when the number_type is a not valid type' do
      before { phone_number.number_type = 'house' }

      it { expect(phone_number).to_not be_valid }
    end

    context 'when the number_type is empty' do
      before { phone_number.number_type = nil }

      it { expect(phone_number).to_not be_valid }
    end

    context 'when the main is empty' do
      before { phone_number.main = nil }

      it { expect(phone_number).to_not be_valid }
    end

    context 'when contacts already have the number' do
      before { create :phone_number, contact: phone_number.contact, number: phone_number.number }

      it { expect(phone_number).to_not be_valid }
    end

    context 'when contacts already have a previous main number' do
      before { create :phone_number, contact: phone_number.contact }

      it { expect(phone_number).to be_valid }
    end
  end
end
