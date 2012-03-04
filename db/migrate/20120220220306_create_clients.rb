class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :f_name
      t.string :mi
      t.string :l_name
      t.date :birth_date
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :medicare_num
      t.string :medicaid_num
      t.string :member_num
      t.string :soc_sec_care_mgr
      t.string :sscm_ph
      t.string :nurse_care_mgr
      t.string :ncm_ph
      t.string :emer_contact
      t.string :ec_ph
      t.string :pri_care_phy
      t.string :pcp_ph

      t.timestamps
    end
  end
end
