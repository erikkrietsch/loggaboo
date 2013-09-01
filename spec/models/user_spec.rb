require 'spec_helper'

describe User do
	let(:user) { FactoryGirl.build(:user) }
	it "should exist" do
		expect(user).to_not be_nil
	end
  	it "should have a first name" do
		expect(user.first_name).to_not be_empty
	end
	it "should have an email address" do
		expect(user.email).to_not be_empty
	end
	it "should have an auth_token" do
		expect(user.auth_token).to_not be_empty
	end
end
