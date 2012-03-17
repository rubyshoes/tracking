class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :codes, :codename, :code_name
  end
end
