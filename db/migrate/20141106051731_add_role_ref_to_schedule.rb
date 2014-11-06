class AddRoleRefToSchedule < ActiveRecord::Migration
  def change
    add_reference :schedules, :role, index: true
  end
end
