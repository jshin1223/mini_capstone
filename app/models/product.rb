class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true # better to do in separate lines 
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 500 }
  validates :description, length: { minimum: 10 } # or validates :description, length: { maximum: 500, minimum: 10 } 
  # or validates :description, length: { in: 10..500 } 
  validates :description, presence: true 
  validates :image_url, presence: true
  

  def is_discounted?
    price < 10 
    # price < 10 ? true : false
  end


  def tax 
    price * 0.09
  end

  def total
    tax + price
  end

end

