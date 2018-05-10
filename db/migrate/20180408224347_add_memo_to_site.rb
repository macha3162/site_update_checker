class AddMemoToSite < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :site_type, :integer
    add_column :sites, :title, :string
    add_column :sites, :operator, :string
    add_column :sites, :note, :text
  end
end
