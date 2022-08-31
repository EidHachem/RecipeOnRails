class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, dependent: :destroy, class_name: 'RecipeFood', through: :recipe_foods

  validates :name, :preparation_time, :cooking_time, :description, presence: true
end
