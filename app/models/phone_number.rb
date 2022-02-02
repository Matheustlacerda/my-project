class PhoneNumber < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true, uniqueness: { scope: :contact,
    message: "cannot have repeated number for a contact" }
  validates :number_type, presence: true, inclusion: { in: %w(home work other),
    message: "%{value} is not a valid type" }, uniqueness: { scope: :contact,
      message: "cannot have repeated number type for a contact" }
  validates :main, uniqueness: { scope: :contact,
    message: "a contact can only have one main number" }
  validates_inclusion_of :main, :in => [true, false]
end
