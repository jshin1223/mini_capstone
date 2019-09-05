class ChangePriceAndDescriptionOnProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 5, scale: 2
    change_column :products, :description, :text

  end
end
