require 'spec_helper'

describe User do

	before do 
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar") 
	end

	subject { @user }

 	it { should respond_to(:name) }
 	it { should respond_to(:email) }
 	it { should respond_to(:password_digest) }
 	it { should respond_to(:password) }
 	it { should respond_to(:password_confirmation) }
 	it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }

 	describe "when name is not present" do
 		before { @user.name = '' }
 		it {should_not be_valid }
 	end

 	describe "when email is not present" do
 		before { @user.email = '' }
 		it {should_not be_valid }
 	end

 	describe "when name is too long" do
 		before { @user.name = 'a' * 51 }
 		it {should_not be_valid }
 	end

 	describe "when email is invalid format" do
 		it "should not be valid" do 
	 		invalid_emails = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com em@il..com]

	 		invalid_emails.each do |invalid_email|
	 			@user.email = invalid_email
	 			expect(@user).not_to be_valid 
	 		end
	 	end
 	end

 	describe "email is already taken" do
 		before do 
 			user_same_email = @user.dup
 			user_same_email.email = @user.email.upcase
 			user_same_email.save
 		end

 		it {should_not be_valid}
 	end

 	describe "password is too short" do
 		before {@user.password = "foo" }
 		it {should_not be_valid}
 	end

 	describe "when password is not present" do
 		before do
 			@user.password = "";
 			@user.password_confirmation = "";
 		end

 		it { should_not be_valid }
 	end

 	describe "when password doesn't match confirmation" do
	  before { @user.password_confirmation = "mismatch" }
	  it { should_not be_valid }
	end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    specify{ expect(User.any?).to be_true}

    describe "with valid password" do



      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
 	
end
