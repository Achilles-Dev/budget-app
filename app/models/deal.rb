class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :category_deals
  has_many :categories, through: :category_deals

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount,
            numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**9) }
end
