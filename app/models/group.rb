class Group < ApplicationRecord
  validates :title, presence:{message:"请填写主题"}
  validates :city, presence:{message:"请填写举办地点"}
end
