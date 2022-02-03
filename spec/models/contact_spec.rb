# frozen_string_literal: true

require 'rails_helper'

describe Contact, type: :model do
  context 'contact validation test' do
    it 'contact must have a name' do
      user = User.create(name: 'Jane', age: 30)
      contact = Contact.create(name: 'John', user_id: user.id)
      expect(contact.valid?).to eq(true)
    end

    it 'cannot save a contact without a name' do
      user = User.create(name: 'Jane', age: 30)
      contact = Contact.create(bith_date: 10 / 10 / 2000, user_id: 1)
      expect(contact.valid?).to eq(false)
    end

    it 'cannot create a second contact with a previous name' do
      user = User.create(name: 'Jane', age: 30)
      contact = Contact.create(name: 'John', user_id: 1)
      contact_2 = Contact.create(name: 'John', user_id: 1)
      expect(contact.valid?).to eq(true)
      expect(contact_2.valid?).to eq(false)
    end

    it 'can create a same contact for differentet user' do
      user = User.create(name: 'Jane', age: 30)
      user1 = User.create(name: 'John', age: 30)
      contact = Contact.create(name: 'John', user_id: 1)
      contact_2 = Contact.create(name: 'John', user_id: 2)
      expect(contact.valid?).to eq(true)
      expect(contact_2.valid?).to eq(true)
    end
  end
end
