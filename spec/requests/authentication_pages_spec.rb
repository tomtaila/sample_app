require 'spec_helper'

describe "Authentication" do
	
	subject {page}

	describe "Sign in page" do
		before {visit signin_path}
		it{should have_title("Sign in")}
		it{should have_content("Sign in")}

		describe "Invalid credentials" do
			before {click_button "Sign in"}
	  		it {should have_title("Sign in")} #Should reload same page
	  		it {should have_selector("div.alert.alert-error")}#Should show error message

	  	#Error message should not persist onto another page being clicked
	  	describe "after visiting another page" do
	  		before{click_link "Home"}
	  		it{should_not have_selector("div.alert.alert-error")}
	  	end
	  end

	  describe "Valid credentials" do
	  	#Session should be created
	  	#User should be redirected to their profile page
	  	let(:user) {FactoryGirl.create(:user)}
	  	before do
	  		valid_signin(user)
	  	end

	  	it{should have_content user.name}
	  	it{should have_link("Sign out", href: signout_path)}
	  	it{should have_link("Profile", href: user_path(user))}
	  	it{should_not have_link("Sign in", href: signin_path)}

	  	describe "Signing out" do
	  		before{click_link 'Sign out'}
	  		it{should have_link('Sign in', href: signin_path)}
	  		it{should_not have_link('Sign out', href: signout_path)}
	  	end
	  end

	end

end
