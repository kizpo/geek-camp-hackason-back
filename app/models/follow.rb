class Follow < ApplicationRecord
    belongs_to :follower, class_name: "Viewer"
    belongs_to :followee, class_name: "Streamer"

    validates :follower_id, uniqueness: { scope: :followee_id, message: "already following this streamer" }
end
