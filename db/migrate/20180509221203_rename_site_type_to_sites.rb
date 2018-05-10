class RenameSiteTypeToSites < ActiveRecord::Migration[5.1]
  def change
    rename_column :sites, :site_type, :site_type_id
  end
end
