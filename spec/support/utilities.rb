include ApplicationHelper

def valid_signin(user)
	fill_in "Email", with: user.email.upcase
	fill_in "Password", with: user.password
	click_button "Sign in"
end


RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert.alert-error', text: message)
	end
end

def valid_create_user(name, email, password)
	fill_in 'Name', with: name
	fill_in 'Email', with: email
	fill_in 'Password', with: password
	fill_in 'Confirmation', with: password
end



