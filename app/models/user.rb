class User < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true
end
