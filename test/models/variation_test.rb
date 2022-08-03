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
require 'test_helper'

class VariationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
