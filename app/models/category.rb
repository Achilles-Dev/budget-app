class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :category_deals, dependent: :destroy
  has_many :deals, through: :category_deals, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true

  def total_amount
    deals.reduce(0) do |total, deal|
      total + (deal[:amount])
    end
  end
end
