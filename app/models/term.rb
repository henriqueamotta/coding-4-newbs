class Term < ApplicationRecord
  has_many :article

  validates :name, presence: true
  validates :description, presence: true
end
