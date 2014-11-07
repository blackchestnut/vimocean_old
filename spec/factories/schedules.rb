FactoryGirl.define do
  factory :schedule do
    started_at "2014-06-02 00:09:03"
    finished_at "2014-06-02 00:09:03"
    priority 1
    state :pending
    user nil
    role nil
    task nil
  end
end
