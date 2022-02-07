# frozen_string_literal: true

class PhoneNumber < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true, uniqueness: { scope: :contact,
                                                   message: 'cannot have repeated number for a contact' }
  validates :number_type, presence: true, inclusion: { in: %w[home work other],
                                                       message: '%{value} is not a valid type' }
  validates :main, uniqueness: { scope: :contact, conditions: -> { where.not(main: false) },
                                 message: 'a contact can only have one main number' }
  validates :main, inclusion: { in: [true, false] }
end
