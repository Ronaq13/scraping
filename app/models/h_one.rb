class HOne < ApplicationRecord
  belongs_to :url

  validates :content, presence: true
end
