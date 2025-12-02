class Article < ApplicationRecord
  has_one_attached :photo
  has_many :forums, dependent: :destroy

  belongs_to :term

  validates :name, presence: true
  validates :content, presence: true
end
