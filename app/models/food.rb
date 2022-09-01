class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy, class_name: 'RecipeFood'

  validates :name, :price, :quantity, :measurement_unit, presence: true
end
