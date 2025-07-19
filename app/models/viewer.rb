class Viewer < ApplicationRecord
    has_secure_password

    has_many :comments, dependent: :destroy
    has_many :follows, foreign_key: :follower_id, dependent: :destroy
    has_many :followed_streamers, through: :follows, source: :followee

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
