# frozen_string_literal: true

require 'rails_helper'

describe Contact, type: :model do
  context 'contact validation test' do
    it 'contact must have a name' do
      user = User.new(name: 'Jane', age: 30)
      contact = Contact.new(name: 'John', user:)
      expect(contact.valid?).to eq(true)
    end

    it 'cannot save a contact without a name' do
      user = User.new(name: 'Jane', age: 30)
      contact = Contact.new(bith_date: 10 / 10 / 2000, user:)
      expect(contact.valid?).to eq(false)
    end

    it 'cannot create a second contact with a previous name' do
      user = User.new(name: 'Jane', age: 30)
      contact = Contact.new(name: 'John', user:)
      contact_2 = Contact.new(name: 'John', user:)
      expect(contact_2.valid?).to eq(false)
    end

    it 'can create a same contact for differentet user' do
      user = User.new(name: 'Jane', age: 30)
      user1 = User.new(name: 'John', age: 30)
      contact = Contact.new(name: 'John', user:)
      contact_2 = Contact.new(name: 'John', user: user1)
      expect(contact.valid?).to eq(true)
      expect(contact_2.valid?).to eq(true)
    end
  end
end
