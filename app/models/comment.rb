class Comment < ApplicationRecord
  validates :review, presence:{message:"评论内容不能为空"}
  belongs_to :user
  belongs_to :group, counter_cache: true

  scope :recent, -> {order("created_at DESC")}
end
