# == Schema Information
#
# Table name: text_shouts
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TextShout < ApplicationRecord
  validates :body, presence: true, length: { in: 1..144 }
end
