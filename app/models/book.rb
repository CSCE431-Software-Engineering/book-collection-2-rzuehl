class Book < ApplicationRecord
  #enables validation for the Title attribute
  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true
  validates :published_date, presence: true
end
