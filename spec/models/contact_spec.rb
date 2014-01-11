require 'spec_helper'

describe Contact do
  
  before { @contact = Contact.new(name: "Example User", 
  									email: "user@example.com", 
  									comments: "Lorem Ipsum" ) }

  subject { @contact }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:comments) }

  describe "when name is too long" do
  	before { @contact.name = 'a' * 51 }
  	it { should_not be_valid }
  end

  describe "when invalid email" do
  	it "should be invalid" do
  		addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com em@il..com]
        addresses.each do |invalid_addresses|
        	@contact.email = invalid_addresses
        	expect(@contact).not_to be_valid
        end
    end
  end

  describe "When comments are left blank" do
  	before { @contact.comments = ""}
  	it { should_not be_valid }
  end

end
