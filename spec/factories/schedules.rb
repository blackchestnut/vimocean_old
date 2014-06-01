# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schedule do
    task ""
    started_at "2014-06-02 00:09:03"
    finished_at "2014-06-02 00:09:03"
    priority 1
    state "MyString"
  end
end
