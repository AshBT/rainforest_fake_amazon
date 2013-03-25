require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@p = FactoryGirl.create(:second_product)
  	@p2 = FactoryGirl.create(:second_product)
  	assert @p.valid?
  end

  #def test_must_have_a_description
  test "must have a description" do
  	@p.description = ""
  	refute @p.valid?
  end

  test "product must have a name" do
  	@p2.name = ""
  	refute @p2.valid?
  end

  test "price_in_cents must be an integer" do
  	@p.price_in_cents = 0.1
  	assert !@p.valid?
  end

  test "must have a price_in_cents" do
    @p.price_in_cents = nil
    refute @p.valid?
  end

  test "must have a price_in_dollars" do
    @p.price_in_cents = nil # since the factory creates a product with a price

    @p.price_in_dollars = nil
    refute @p.valid?
  end

  test "update cents value from price_in_dollars correctly" do
    @p.price_in_cents = 999
    assert_equal 9.99, @p.price_in_dollars
  end

  test "must refute invalid price_in_dollars" do
    @p.price_in_cents = nil
    @p.price_in_dollars = "abc"

    assert_equal nil, @p.price_in_dollars
    refute @p.valid?
  end

  test "must handle many decimal places price_in_dollars" do
    @p.price_in_cents = nil
    @p.price_in_dollars = "12.90123"

    assert_equal 12.90, @p.price_in_dollars
    assert_equal 1290, @p.price_in_cents
    assert @p.valid?
  end

  # test "dollar conversion is not performed for empty/blank cents value" do
  #     @p
  #   refute @p.valid?
  # end

end
