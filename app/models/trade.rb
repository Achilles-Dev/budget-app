class Trade < ApplicationRecord
  belongs_to :user
  has_many :group_trades
  has_many :groups, through: :group_trades

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount,
            numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**9) }
end
