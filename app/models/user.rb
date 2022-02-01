class User < ApplicationRecord
  validates :name, presence: , uniqueness: true

  has_many :contacts
end
