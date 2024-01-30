class Book < ApplicationRecord
  #enables validation for the Title attribute
  validates :title, presence: true
end
