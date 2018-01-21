class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.string :start_with
      t.string :end_with
      t.integer :site_versions_count
      t.string :status
      t.datetime :last_crawled_at

      t.timestamps
    end
  end
end
