require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@p = FactoryGirl.create(:second_product)
  	assert @p.valid?
  end

  #def test_must_have_a_description
  test "must have a description" do
  	@p.description = ""
  	refute @p.valid?
  end

  test "product must have a name" do
  	@p2 = FactoryGirl.create(:second_product)
  	@p2.name = ""
  	refute @p2.valid?
  end


end
