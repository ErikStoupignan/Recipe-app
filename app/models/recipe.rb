class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
end
