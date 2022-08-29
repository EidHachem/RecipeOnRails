class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy

  validates :name, :description, :cooking_time, :preparation_time, presence: true
end
