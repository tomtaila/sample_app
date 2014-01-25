require 'spec_helper'

describe ApplicationHelper do

	describe 'full_title' do
		it "Should include the correct page title" do
			expect(full_title('abcdefg')).to match(/abcdefg/)
		end

		it "Should include the base title" do
			expect(full_title('')).to match(/Ruby on Rails Tutorial Sample App/)
		end

		it "should not include a bar for the home page" do
      		expect(full_title("")).not_to match(/\|/)
    	end
	end

end