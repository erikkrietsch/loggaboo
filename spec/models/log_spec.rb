require 'spec_helper'

describe Log do
	let(:log) { FactoryGirl.build(:log)	}
	it "should exist" do
		expect(log).to_not be_nil
	end
  	it "should have a creator" do
		expect(log.creator).to be_an_instance_of(User)
	end
	it "should belong to at least one baby" do
		expect(log.babies.first).to be_an_instance_of(Baby)
	end
  
end
