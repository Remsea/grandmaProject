class Grandma < ApplicationRecord
  has_many :transactions, dependent: :destroy
  belongs_to :user
  belongs_to :competence

  validates :name, presence: true
  # validates :description, presence: true
  # validates :price, presence: true
  # validates :address, presence: true
  # validates :age, presence: true
  # validates :photo, presence: true
  # validates :competence, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
