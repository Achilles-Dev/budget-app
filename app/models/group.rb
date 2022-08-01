class Group < ApplicationRecord
  belongs_to :user
  has_many :group_trades
  has_many :trades, through: :group_trades

  validates :name, presence: true, length: { maximum: 250 }
end
