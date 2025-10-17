class Book < ApplicationRecord
  validates :email, presence: true
  validates :status, presence: true
end
