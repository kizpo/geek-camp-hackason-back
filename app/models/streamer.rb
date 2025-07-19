class Streamer < ApplicationRecord
    has_secure_password

    has_many :streams, dependent: :destroy
    has_many :followers, class_name: "Viewer", through: :follows

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :donation_share_ratio, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 }
end
