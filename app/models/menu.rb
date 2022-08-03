# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  name       :string
#  desc       :text
#  item_price :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Menu < ApplicationRecord
    has_many :variations
    has_many :addons
end
