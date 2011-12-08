class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.text :mi
      t.string :marital_status
      t.string :gender
      t.date :birth_date
      t.date :hire_date
      t.date :term_date
      t.string :primary_position
      t.string :trained_position
      t.string :email
      t.boolean :active
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zip_code
      t.string :state
      t.string :emp_home_ph
      t.string :emp_mobile_ph
      t.string :emer_contact_first_name
      t.string :emer_contact_last_name
      t.string :emer_contact_relationship
      t.string :emer_contact_ph

      t.timestamps
    end
  end
end
