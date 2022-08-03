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
require 'test_helper'

class AddonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
