require 'spec_helper'

describe "User Pages" do

	subject { page }

	describe "Sign up page" do

		before { visit signup_path }

		it { should have_title( full_title("Sign up"))}
		it { should have_content("Sign up!") }

		describe "with invalid information" do
			it "should not create a user" do
				expect{ click_button "Sign up"}.not_to change(User, :count)
			end

			describe "should display error messages" do
				before {click_button "Sign up"}

				it { should have_content ("error") }
			end

		end

		describe "with valid information" do
			before do 
				fill_in "Name", 		with: "Example User"
				fill_in "Email", 		with: "user@example.com"
				fill_in "Password", 	with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end

			it "should create a user" do
				expect {click_button "Sign up"}.to change(User, :count)
			end
		end

	end



	describe "Show pages" do

		# replace with code to make user variable
		let(:user) {FactoryGirl.create(:user)}

		before { visit user_path(user) }

		it { should have_title( full_title(user.name)) }
		it { should have_content(user.name) }

	end


end