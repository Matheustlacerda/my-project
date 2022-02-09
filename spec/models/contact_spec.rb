# frozen_string_literal: true

require 'rails_helper'

describe Contact, type: :model do
  describe 'validations' do
    let(:contact) { build :contact }

    it { expect(contact).to be_valid }

    context 'when the contact name is empty' do
      before { contact.name = nil }

      it { expect(contact).to_not be_valid }
    end

    context 'when contacts have the same user' do
      before { create :contact, user: contact.user }
    
      it { expect(contact).to be_valid }
    end

    context 'when the contact name is already taken for the user' do
      before { create :contact, user: contact.user, name: contact.name }
    
      it { expect(contact).not_to be_valid }
    end
  end
end
