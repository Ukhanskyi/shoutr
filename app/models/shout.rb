# == Schema Information
#
# Table name: shouts
#
#  id           :bigint           not null, primary key
#  body         :string           not null
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  content_type :string           not null
#  content_id   :integer          not null
#
class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
