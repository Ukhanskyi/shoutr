# == Schema Information
#
# Table name: following_relationships
#
#  id               :bigint           not null, primary key
#  follower_id      :bigint
#  followed_user_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class FollowingRelationship < ApplicationRecord
  belongs_to :follower, class_name: 'User', counter_cache: :followed_users_count
  belongs_to :followed_user, class_name: 'User', counter_cache: :followers_count
end
