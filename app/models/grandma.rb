class Grandma < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
=======
  has_many :transactions
  belongs_to :user

  validates :name, presence: true
  # validates :description, presence: true
  # validates :price, presence: true
  # validates :address, presence: true
  # validates :age, presence: true
  # validates :photo, presence: true
  # validates :competence, presence: true
>>>>>>> 36246a8358db423455763fc34ac35eac48c7988d
end
