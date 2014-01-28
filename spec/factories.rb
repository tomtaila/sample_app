FactoryGirl.define do
	factory :user do 
		name "Tom Taila"
		email "user@example.com"
		password "password"
		password_confirmation "password"
	end
end