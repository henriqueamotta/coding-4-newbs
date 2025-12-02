class Term < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
