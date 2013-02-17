class CreateDailyActivities < ActiveRecord::Migration
  def change
    create_table :daily_activities do |t|
      t.integer :employee_id
      t.integer :code_id
      t.integer :contract_id
      t.integer :codeline_id
      t.integer :client_id
      t.date :day
      t.date :start
      t.date :end
      t.decimal :direct_time, :precision => 6, :scale => 2 
      t.decimal :indirect_time, :precision => 6, :scale => 2 
      t.decimal :general_training, :precision => 6, :scale => 2 
      t.decimal :general_meeting, :precision => 6, :scale => 2 
      t.decimal :other, :precision => 6, :scale => 2 
      t.decimal :comp_time_taken, :precision => 6, :scale => 2 
      t.string :comment
      t.string :employee_name
      t.string :client_name
      t.string :code_name

      t.timestamps
    end
  end
end
