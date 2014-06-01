class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :task
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :priority
      t.string :state

      t.timestamps
    end
  end
end
