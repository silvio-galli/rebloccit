require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }

  it { is_expectec.to have_many(:posts) }

  # tests for name
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }
  # tests for email
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should allow_value("user@bloccit.com").for(:email) }
  it { should_not allow_value("userbloccit.com").for(:email) }
  # tests for password
  it { should validate_presence_of(:password) }
  it { should have_secure_password }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
  	it "should respond to name" do
  		expect(user).to respond_to(:name)
  	end

  	it "should respond to email" do
  		expect(user).to respond_to(:email)
  	end
  end

  describe "invalid user" do
  	let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
  	let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }
  	let(:user_with_invalid_email_format) { User.new(name: "Bloccit User", email: "invalid_format.com") }
		
		it "should be an invlaid user due to blank name" do
			expect(user_with_invalid_name).to_not be_valid
		end
		
		it "should be an invalid user due to blank email" do
			expect(user_with_invalid_email).to_not be_valid
		end

		it "should be an invalid user due to invalid email format" do
			expect(user_with_invalid_email_format).to_not be_valid
		end
  end
end
