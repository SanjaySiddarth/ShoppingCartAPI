# == Schema Information
#
# Table name: variations
#
#  id         :integer          not null, primary key
#  menu_id    :integer          not null
#  name       :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Variation < ApplicationRecord
    belongs_to :menu
end
