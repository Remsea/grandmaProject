class Competence < ApplicationRecord
  has_many :grandmas

  def to_s
    name
  end
end
