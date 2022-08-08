FactoryBot.define do 
  factory :user do
    name { 'ankit' }
    email { "ankit#{Time.now.to_f}@gmail.com" }
    password { 'blahblah' }
    # is_admin { true }
  end
end