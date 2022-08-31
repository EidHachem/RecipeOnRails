class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, dependent: :destroy, class_name: 'RecipeFood', through: :recipe_foods

  validates :name, :price, :quantity, :measurement_unit, presence: true
end
