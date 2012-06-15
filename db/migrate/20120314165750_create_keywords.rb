class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :keyword
      t.string :language
      t.date :last_search

      t.timestamps
    end
  end
end
