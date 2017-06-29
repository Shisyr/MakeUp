# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  title       :string
#  active      :boolean          default(FALSE)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SubCategory < ApplicationRecord
  has_many :products
  belongs_to :category
  validates :title, presence: true
  validates :active, presence: true
  validates :category_id, presence: true
end
