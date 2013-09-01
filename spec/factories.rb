FactoryGirl.define do
	sequence :email do |n|
		"user#{n}@poopsy.co"
	end

	factory :user, aliases: [:owner, :creator] do
		first_name "Test"
		last_name  "User"
		email 
		auth_token { rand(99999999).to_s }
	end

	factory :baby do
		ignore do	
			user_count 3
		end
		name "Brycie Reed Keetsh"
		birthday Date.strptime('3-20-2011', '%m-%d-%Y')
		association :owner, factory: :user, strategy: :build
		after(:build) do |baby, evaluator|
			baby.users = FactoryGirl.build_list(:user, evaluator.user_count)
		end
	end
	factory :log_entry do

		factory :log_other_entry do
			
			notes "test notes"
			association :creator, factory: :user, strategy: :build
			#attr_accessible :notes, :creator_id, :log_id, :loggable_type, :loggable_id, :when
		end
	end

	factory :log do
		ignore do
			baby_count 5
			log_entry_count 5
		end
		association :creator, factory: :user, strategy: :build
		after(:build) do |log, evaluator|
      log.babies = FactoryGirl.build_list(:baby, evaluator.baby_count)
      log.log_entries = FactoryGirl.build_list(:log_other_entry, evaluator.log_entry_count)
    end
	end
  # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end