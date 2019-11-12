class Grandma < ApplicationRecord
  has_many :transactions
  belongs_to :user

  validates :name, presence: true
  # validates :description, presence: true
  # validates :price, presence: true
  # validates :address, presence: true
  # validates :age, presence: true
  # validates :photo, presence: true
  # validates :competence, presence: true
end
