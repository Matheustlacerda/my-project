# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :contacts
  has_many :phone_numbers, through: :contacts
end
