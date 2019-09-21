# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# {
#   id: product.id,
#   name: product.name,
#   price: product.price,
#   image_url: product.image_url,
#   description: product.description

# }


# Categories
# [[2, "Cheap"], [3, "Expensive"], [4, "Damage"], [5, "Home Goods"]]

# Products

# [
# [4, "jacket", 0.3e2], 
# [5, "women's jacket", 0.3e2], 
# [6, "jeans", 0.3e2], 
# [3, "new product 2", 0.25e2], 
# [2, "new product", 0.2e2], 
# [1, "Long Sleeve Shirt", 0.2e2]]

ProductCategory.create(product_id: 1, category_id: 2)
ProductCategory.create(product_id: 1, category_id: 4)
ProductCategory.create(product_id: 1, category_id: 5)
ProductCategory.create(product_id: 2, category_id: 2)
ProductCategory.create(product_id: 2, category_id: 4)
ProductCategory.create(product_id: 2, category_id: 5)
ProductCategory.create(product_id: 3, category_id: 3)
ProductCategory.create(product_id: 3, category_id: 4)
ProductCategory.create(product_id: 3, category_id: 5)
ProductCategory.create(product_id: 4, category_id: 2)
ProductCategory.create(product_id: 4, category_id: 4)
ProductCategory.create(product_id: 4, category_id: 5)
ProductCategory.create(product_id: 5, category_id: 2)
ProductCategory.create(product_id: 5, category_id: 4)
ProductCategory.create(product_id: 5, category_id: 5)
ProductCategory.create(product_id: 6, category_id: 2)
ProductCategory.create(product_id: 6, category_id: 4)
ProductCategory.create(product_id: 6, category_id: 5)

