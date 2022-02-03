# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  context 'phone number validation test' do
    it 'phone number must have number, number type and main' do
      user = User.create(name: 'Jane', age: 30)
      contact = Contact.create(name: 'John', user_id: 1)
      phone = PhoneNumber.create(number: '123456789',
                                 number_type: 'home',
                                 main: true,
                                 contact_id: 1)
      expect(phone.valid?).to eq(true)
    end

    it 'cannot save phone number without number' do
      user = User.create(name: 'Jane', age: 30)
      contact = Contact.create(name: 'John', user_id: 1)
      phone = PhoneNumber.create(number_type: 'home',
                                 main: true,
                                 contact_id: 1)
      expect(phone.valid?).to eq(false)
    end

    it 'cannot save phone number without number type' do
      user = User.create(name: 'Jane', age: 30)
      contact = Contact.create(name: 'John', user_id: 1)
      phone = PhoneNumber.create(number: '123456789',
                                 main: true,
                                 contact_id: 1)
      expect(phone.valid?).to eq(false)
    end

    it 'cannot save phone number without the right number_type' do
      user = User.create(name: 'Jane', age: 30)
      contact = Contact.create(name: 'John', user_id: 1)
      phone = PhoneNumber.create(number: '123456789',
                                 number_type: 'job',
                                 main: true,
                                 contact_id: 1)
      expect(phone.valid?).to eq(false)
    end

    it 'cannot save phone number without main' do
      user = User.create(name: 'Jane', age: 30)
      contact = Contact.create(name: 'John', user_id: 1)
      phone = PhoneNumber.create(number: '123456789',
                                 number_type: 'home',
                                 contact_id: 1)
      expect(phone.valid?).to eq(false)
    end

    it 'cannot create two igual numbers for a contact' do
      user = User.create(name: 'Jane', age: 30)
      contact = Contact.create(name: 'John', user_id: 1)
      phone = PhoneNumber.create(number: '123456789',
                                 number_type: 'home',
                                 main: true,
                                 contact_id: 1)
      phone2 = PhoneNumber.create(number: '123456789',
                                  number_type: 'work',
                                  main: false,
                                  contact_id: 1)
      expect(phone.valid?).to eq(true)
      expect(phone2.valid?).to eq(false)
    end

    it 'cannot create a numbers with the same number_type' do
      user = User.create(name: 'Jane', age: 30)
      contact = Contact.create(name: 'John', user_id: 1)
      phone = PhoneNumber.create(number: '123456789',
                                 number_type: 'home',
                                 main: true,
                                 contact_id: 1)
      phone2 = PhoneNumber.create(number: '1234567890',
                                  number_type: 'home',
                                  main: false,
                                  contact_id: 1)
      expect(phone.valid?).to eq(true)
      expect(phone2.valid?).to eq(false)
    end

    it 'cannot create a numbers with two main number' do
      user = User.create(name: 'Jane', age: 30)
      contact = Contact.create(name: 'John', user_id: 1)
      phone = PhoneNumber.create(number: '123456789',
                                 number_type: 'home',
                                 main: true,
                                 contact_id: 1)
      phone2 = PhoneNumber.create(number: '1234567890',
                                  number_type: 'work',
                                  main: true,
                                  contact_id: 1)
      expect(phone.valid?).to eq(true)
      expect(phone2.valid?).to eq(false)
    end
  end
end
