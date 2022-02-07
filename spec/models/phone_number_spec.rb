# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  context 'phone number validation test' do
    it 'phone number must have number, number type and main' do
      user = User.new(name: 'Jane', age: 30)
      contact = Contact.new(name: 'John', user:)
      phone = PhoneNumber.new(number: '123456789',
                              number_type: 'home',
                              main: true,
                              contact:)
      expect(phone.valid?).to eq(true)
    end

    it 'cannot save phone number without number' do
      user = User.new(name: 'Jane', age: 30)
      contact = Contact.new(name: 'John', user:)
      phone = PhoneNumber.new(number_type: 'home',
                              main: true,
                              contact:)
      expect(phone.valid?).to eq(false)
    end

    it 'cannot save phone number without number type' do
      user = User.new(name: 'Jane', age: 30)
      contact = Contact.new(name: 'John', user:)
      phone = PhoneNumber.new(number: '123456789',
                              main: true,
                              contact:)
      expect(phone.valid?).to eq(false)
    end

    it 'cannot save phone number without the right number_type' do
      user = User.new(name: 'Jane', age: 30)
      contact = Contact.new(name: 'John', user:)
      phone = PhoneNumber.new(number: '123456789',
                              number_type: 'job',
                              main: true,
                              contact:)
      expect(phone.valid?).to eq(false)
    end

    it 'cannot save phone number without main' do
      user = User.new(name: 'Jane', age: 30)
      contact = Contact.new(name: 'John', user:)
      phone = PhoneNumber.new(number: '123456789',
                              number_type: 'home',
                              contact:)
      expect(phone.valid?).to eq(false)
    end

    it 'cannot create two igual numbers for a contact' do
      user = User.new(name: 'Jane', age: 30)
      contact = Contact.new(name: 'John', user:)
      phone = PhoneNumber.new(number: '123456789',
                              number_type: 'home',
                              main: true,
                              contact:)
      phone2 = PhoneNumber.new(number: '123456789',
                               number_type: 'work',
                               main: false,
                               contact:)
      expect(phone.valid?).to eq(true)
      expect(phone2.valid?).to eq(false)
    end

    it 'cannot create a numbers with two main number' do
      user = User.new(name: 'Jane', age: 30)
      contact = Contact.new(name: 'John', user:)
      phone = PhoneNumber.new(number: '123456789',
                              number_type: 'home',
                              main: true,
                              contact:)
      phone2 = PhoneNumber.new(number: '1234567890',
                               number_type: 'work',
                               main: true,
                               contact:)
      expect(phone.valid?).to eq(true)
      expect(phone2.valid?).to eq(false)
    end
  end
end
