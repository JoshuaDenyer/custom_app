require 'spec_helper'

describe "AuthenticationPages" do
	subject {page}

	describe "sign in page" do
		before {visit signin_path}

		it { should have_title(full_title("Sign in")) }
		it { should have_content("Sign in") }

		describe "with invalid info" do
			before {click_button "Sign in" }

			it { should have_selector('div.alert.alert-error')}
		end

		describe "with valid info" do

			let(:user) {FactoryGirl.create(:user)}

			before do
				
				fill_in "Email", with: user.email.upcase
				fill_in "Password", with: user.password
				click_button "Sign in"
			end

			it {should have_link("Profile", href: user_path(user))}
		end
	end



end
