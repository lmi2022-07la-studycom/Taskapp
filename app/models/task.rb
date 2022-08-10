class Task < ApplicationRecord
    # include RankedModel
    # ranks :id
    validates :title, presence: true, length: {maximum: 255}
    belongs_to :user
end
