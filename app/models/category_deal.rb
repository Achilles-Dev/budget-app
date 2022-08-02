class CategoryDeal < ApplicationRecord
  belongs_to :category
  belongs_to :deal

  validates :name, presence: true, length: { maximum: 250 }
end
