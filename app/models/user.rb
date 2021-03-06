# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  email                :string           not null
#  encrypted_password   :string(128)      not null
#  confirmation_token   :string(128)
#  remember_token       :string(128)      not null
#  username             :string
#  followed_users_count :integer          default(0), not null
#  followers_count      :integer          default(0), not null
#
class User < ApplicationRecord
  include Clearance::User

  has_many :shouts, dependent: :destroy

  has_many :likes
  has_many :liked_shouts, through: :likes, source: :shout

  has_many :followed_user_relationships,
           foreign_key: :follower_id,
           class_name: 'FollowingRelationship',
           dependent: :destroy
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
           foreign_key: :followed_user_id,
           class_name: 'FollowingRelationship',
           dependent: :destroy
  has_many :followers, through: :follower_relationships

  validates :username, presence: true, uniqueness: true

  def timeline_shouts
    Shout.where(user_id: followed_user_ids + [id])
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.delete(user)
  end

  def following?(user)
    followed_user_ids.include?(user.id)
  end

  def like(shout)
    liked_shouts << shout
  end

  def unlike(shout)
    liked_shouts.destroy(shout)
  end

  def liked?(shout)
    liked_shout_ids.include?(shout.id)
  end

  def to_param
    username
  end
end
