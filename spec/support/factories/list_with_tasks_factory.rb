FactoryGirl.define do
  factory :list_with_tasks, :parent => :list do
    after_create do |list|
      FactoryGirl.create(:task, :list => list)
    end
  end
end