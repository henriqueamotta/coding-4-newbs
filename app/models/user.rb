class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  has_many :forums
  has_many :messages
  has_many :questions, dependent: :destroy

  def self.from_omniauth(auth)
    # Busca o usuário pelo provider (github) e uid (id do usuário no github)
    # Se não encontrar, cria um novo com os dados retornados
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20] # Gera uma senha aleatória segura

    end
  end

  def admin?
    self.admin
  end
end
