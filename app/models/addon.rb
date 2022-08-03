# == Schema Information
#
# Table name: addons
#
#  id         :integer          not null, primary key
#  menu_id    :integer          not null
#  name       :string
#  price      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Addon < ApplicationRecord
    belongs_to :menu
end
