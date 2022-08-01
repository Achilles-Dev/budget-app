class GroupTrade < ApplicationRecord
  belongs_to :group
  belongs_to :trade

  validates :name, presence: true, length: { maximum: 250 }
end
