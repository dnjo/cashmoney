class Payment < ApplicationRecord
  belongs_to :month
  belongs_to :expense
end
