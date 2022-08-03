# == Schema Information
#
# Table name: cart_items
#
#  id          :integer          not null, primary key
#  cart_id     :integer          not null
#  quantity    :integer
#  total_price :float
#  addons      :string
#  variations  :string
#  base_price  :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CartItem < ApplicationRecord
  belongs_to :cart
end
