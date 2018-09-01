class AddLowNoToSites < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :law_no, :integer
  end
end
