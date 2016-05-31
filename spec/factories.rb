FactoryGirl.define do
  factory :build do
    violations_count 0
    payload {JSON.parse(Rails.root.join('spec', 'support', 'fixtures', 'pull_request_opened_event.json').read)}
    trait :repository_build do
      association :repository, :active, :github
      after(:build) { |build| build.repository.update_attribute(:origin_id, build.payload['repository']['id']) }
    end
  end

  factory :repository do
    trait(:active) { active true }
    trait(:inactive) { active false }
    trait(:in_private_org) do
      active true
      private true
    end
    trait(:github) { provider :github }

    sequence(:origin_name) { |n| "user/repo#{n}" }
    private false
    user
  end

  factory :user do
    sequence(:name) { |n| "awesome name #{n}"}
    sequence(:email) { |n| "email{n}@acme.com"}
    sequence(:access_token) { |n| "ultra_secret_token#{n}"}
  end
end
