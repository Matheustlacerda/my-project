# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :user,
                                                 message: 'cannot have repeated contacts for a user' }

  belongs_to :user
  has_many :phone_numbers
end
