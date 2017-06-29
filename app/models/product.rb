# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  price              :float
#  sub_category_id    :integer
#  active             :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Product < ApplicationRecord
  belongs_to :sub_category, optional: true
  has_many :order_items
  default_scope { where(active: true) }
  validates :title, presence: true
  has_attached_file :image,
              styles: {large: "300x300"},
            :default_url => " /Users/Mukhamed/Downloads/instagram-master/app/assets/images/"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
