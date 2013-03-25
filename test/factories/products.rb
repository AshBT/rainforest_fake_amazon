## read about factories at https://github.com/thoughtbot/factory_girl


FactoryGirl.define do
	factory :product do
		name "MyString"
		description "My Text"
		price_in_cents 1
	end

	factory :second_product, :class => Product do
		name "This is a cheaper version of product"
		description "My Text"
		price_in_cents 1
	end

end

