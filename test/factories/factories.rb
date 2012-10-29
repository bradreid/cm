FactoryGirl.define do

  factory :user do
    sequence(:email){ |n| "test#{n}@test.com" }
    password 'thisismypassword'
    password_confirmation 'thisismypassword'
    is_admin true
    active true
    sequence(:username){ |n| "test#{n}" }
    email_new_tools true
    email_new_reviews true
    email_new_user true
    current_role 'developer'

    factory :admin_user do

    end
  end

  factory :review do
    association :tool
    community_context 'true'
    generates_results 'true'
    resources_identified 'true'
    format_presentation 'true'
    adaptable 'true'
    full_name 'Brad Reid'
    role 'Software Dev'

    factory :review_and_user do
      association :user
    end
  end

  factory :tool do |t|
    sequence(:name) { |n| "My crazy test tool: #{n}" }
    source_document_name 'test.pdf'
    source_url 'http://test.com/test.pdf'
    author 'Brad Reid'
    language 'en'
    description 'some description that goes on and on'
    why 'test'
    topic 'test'
    t.when 'test'
    copyright 'no copyright issues'
  end
end
