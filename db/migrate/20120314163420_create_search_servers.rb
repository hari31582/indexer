class CreateSearchServers < ActiveRecord::Migration
  def change
    create_table :search_servers do |t|
      t.string :server
      t.string :base_url
      t.integer :records_per_page

      t.timestamps
    end
  end
end
