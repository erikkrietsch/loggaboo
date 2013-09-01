require 'spec_helper'

describe Baby do
	let(:baby) { FactoryGirl.build(:baby) }
	it "should exist" do
		expect(baby).to_not be_nil
	end
  	it "should have a name" do
		expect(baby.name).to_not be_empty 
	end
	it "should have a birthday" do
		expect(baby.birthday).to be_an_instance_of(Date) 
	end
	it "should have an owner" do
		expect(baby.owner).to be_an_instance_of(User) 
	end
	it "should have at least one user with access" do
		expect(baby.users.to_a.count).to be > 0
	end

end
