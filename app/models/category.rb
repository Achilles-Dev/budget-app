class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :category_deals
  has_many :deals, through: :category_deals

  validates :name, presence: true, length: { maximum: 250 }
end
