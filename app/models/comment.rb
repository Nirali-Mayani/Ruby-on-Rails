class Comment < ApplicationRecord
  belongs_to :post
  validates :title, presence: true
  validates :content, presence: true

end
