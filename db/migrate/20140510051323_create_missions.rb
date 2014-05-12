class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.text :text
      t.references :user, index: true

      t.timestamps
    end
  end
end
