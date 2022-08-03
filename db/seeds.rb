# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Addon.destroy_all
Variation.destroy_all
Menu.destroy_all
CartItem.destroy_all
Cart.destroy_all
User.destroy_all

menu1 = Menu.create(id: 814225, name: "Special Biryani", desc: "Tasty Biryani", item_price: 0.0,)
menu2 = Menu.create(id: 814230, name: "Scoop Of Vanilla Ice Cream", desc: "Scoop of vanilla ice cream topped with Chocolate Sauce", item_price: 150.0)
menu3 = Menu.create(id: 814231, name: "Kesari Gulab Jamun", desc: "The simply authentic Indian taste only cannot resist after a meal ", item_price: 100.0)
menu4 = Menu.create(id: 814232, name: "7 Up", desc: "Soft Drink", item_price: 80.0)
menu5 = Menu.create(id: 814233, name: "Mirinda", desc: "Soft Drink", item_price: 80.0)
menu6 = Menu.create(id: 814224, name: "Thrive Special Pizza", desc: "Cheesy Pizza Topped with fresh veggies and meat! Absolute delight for a cheese and meat lover", item_price: 250.0)

variation1 = Variation.create(id: 428703, menu_id: 814225, name: "Half", price: 250.0)
variation2 = Variation.create(id: 428704, menu_id: 814225, name: "Full", price: 400.0)
variation3 = Variation.create(id: 428707, menu_id: 814224, name: "Small", price: 250.0)
variation4 = Variation.create(id: 428706, menu_id: 814224, name: "Medium", price: 400.0)
variation5 = Variation.create(id: 428705, menu_id: 814224, name: "Large", price: 500.0)

addon1 = Addon.create(id: 428708, menu_id: 814224, name: "Cheese", price: 0.0)
addon2 = Addon.create(id: 428710, menu_id: 814224, name: "Corn", price: 0.0)
addon3 = Addon.create(id: 428711, menu_id: 814224, name: "Mushroom", price: 0.0)
addon4 = Addon.create(id: 428709, menu_id: 814224, name: "Chicken Sausage", price: 75.0)
addon5 = Addon.create(id: 464697, menu_id: 814224, name: "Double Meat", price: 100.0)


user1 = User.create(name: "Sanjay Siddarth", email:"Something@123.com", mobile: "+919980503344")
user2 = User.create(name: "Anjana Rao", email:"anjana.vrao@gmail.com", mobile: "+919980503333")
user3 = User.create(name: "Kripa Rao", email:"kripa@123.com", mobile: "+9199805033334")

cart1 = Cart.create(gross_amount: 100, user: user1)
cart2 = Cart.create(gross_amount: 200, user: user2)
cart3 = Cart.create(gross_amount: 300, user: user3)

cart_item1 = CartItem.create(quantity: 1, total_price: 100.0, base_price: 100.0, cart: cart1)
cart_item1 = CartItem.create(quantity: 1, total_price: 200.0, base_price: 600.0, cart: cart1)
cart_item1 = CartItem.create(quantity: 1, total_price: 300.0, base_price: 700.0, cart: cart2)
cart_item1 = CartItem.create(quantity: 1, total_price: 400.0, base_price: 800.0, cart: cart2)
cart_item1 = CartItem.create(quantity: 1, total_price: 500.0, base_price: 900.0, cart: cart3)


# quantity    :integer
#  total_price :float
#  addons      :string
#  variations  :string
#  base_price  :float