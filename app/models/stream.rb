class Stream < ApplicationRecord
    belongs_to :streamer
    has_many :comments, dependent: :destroy

    validates :title, presence: true
    validates :status, inclusion: { in: %w[live ended scheduled], message: "%{value} is not a valid status" }
end
