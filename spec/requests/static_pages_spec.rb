require 'spec_helper'

describe "StaticPages" do

	subject { page }

	describe "home page" do
		before { visit root_path}

		it { should have_title( "Custom App" ) }
		it { should have_content("Home Page") }  			
	end

	describe "about page" do
		before { visit about_path }

		it { should have_title( "Custom App | About" ) }
		it { should have_content("About Page") } 
	end

end
