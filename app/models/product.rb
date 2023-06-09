class Product < ApplicationRecord
  # Associations

  belongs_to :supplier
  belongs_to :user
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

  # Validations

  # validates :name, presence: true
  # validates :price, presence: true
  # validates :description, presence: true
  # validates :description, length: { minimum: 10 }

  # Additional Code:

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def is_discounted?
    if price > 10
      return false
    else
      return true
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
