class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :keyword_id
      t.integer :search_server_id
      t.string :title
      t.text :description
      t.string :url
      t.integer :position

      t.timestamps
    end
  end
end
