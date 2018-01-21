class CreateSiteVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :site_versions do |t|
      t.integer :site_id
      t.string :checksum
      t.integer :status_code
      t.text :body

      t.timestamps
    end
    add_index :site_versions, :site_id
  end
end
