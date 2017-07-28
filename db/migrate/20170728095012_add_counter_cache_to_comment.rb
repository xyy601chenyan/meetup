class AddCounterCacheToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :comments_count,:integer ,default: 0

    Group.pluck(:id).each do |i|
       Group.reset_counters(i, :comments) # 全部重算一次
    end
  end
end
