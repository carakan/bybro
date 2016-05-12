FactoryGirl.define do
 factory :repository do
    trait(:active) { active true }
    trait(:inactive) { active false }
    trait(:in_private_org) do
      active true
      private true
    end

    sequence(:origin_name) { |n| "user/repo#{n}" }
    private false
  end
end
