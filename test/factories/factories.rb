FactoryGirl.define do

  factory :user do
    email 'test@test.com'
    password 'thisismypassword'
    password_confirmation 'thisismypassword'
    is_admin true
    active true
    username 'testuser'
    email_new_tools true
    email_new_reviews true
    email_new_user true
    current_role 'developer'

    factory :admin_user do

    end
  end

  factory :tool do |t|
    name 'My crazy test tool'
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
