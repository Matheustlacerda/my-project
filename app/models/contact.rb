class Contact < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  has_many :phone_numbers
end
