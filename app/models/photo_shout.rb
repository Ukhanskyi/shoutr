# == Schema Information
#
# Table name: photo_shouts
#
#  id                 :bigint           not null, primary key
#  image_file_name    :string           not null
#  image_content_type :string           not null
#  image_file_size    :bigint           not null
#  image_updated_at   :datetime         not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class PhotoShout < ApplicationRecord
  has_attached_file :image, styles: { thumb: '200x200' }

  validates_attachment :image,
                       content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] },
                       size: { in: 0..10.megabytes },
                       presence: true
end
