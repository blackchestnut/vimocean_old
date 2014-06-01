require 'spec_helper'

describe Task do
  it { should belong_to :user }
  it { should have_many :schedules }

  it { should validate_presence_of :name }
end
