class Transaction < ApplicationRecord
  belongs_to :grandma
  belongs_to :user
end
