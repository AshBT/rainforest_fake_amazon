## read about factories at https://github.com/thoughtbot/factory_girl


FactoryGirl.define do
	factory :product do
		name "Adidas Shoes"
		description "These are size 11 shoes."
		price_in_cents 10000
	end

	factory :second_product, :class => Product do
		name "Nike shoes"
		description "This is a cheaper shoe"
		price_in_cents 6000
	end

end

