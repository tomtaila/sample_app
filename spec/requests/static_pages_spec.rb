require 'spec_helper'

describe "Static pages" do

  subject {page}

  shared_examples_for "All static pages" do
    it{should have_selector('h1', text: heading)}
    it{should have_title(full_title(page_title))}
  end

  describe "Home page" do
    before {visit root_path}
    let(:heading) {'Sample App'}
    let(:page_title) {''}

    it {should_not have_title(' | Home')}
  end

  describe "Help page" do
    before {visit help_path}
  end

  describe "About page" do
    before {visit about_path}
  end

  describe "Contact page" do
    before {visit contact_path}
  end

end