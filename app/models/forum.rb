class Forum < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :messages, dependent: :destroy
end
