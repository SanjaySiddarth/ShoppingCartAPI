# == Schema Information
#
# Table name: carts
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  gross_amount :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
end
