class Comment < ApplicationRecord
    belongs_to :viewer
    belongs_to :stream

    validates :content, presence: true, length: { maximum: 500 }
    validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
