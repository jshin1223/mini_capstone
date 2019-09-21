class CartedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :order, optional: true

  def subtotal
    quantity * product.price
  end
end