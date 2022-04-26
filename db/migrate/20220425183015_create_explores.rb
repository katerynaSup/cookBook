class CreateExplores < ActiveRecord::Migration[7.0]
  def change
    create_table :explores do |t|
      t.string :hashtag_search

      t.timestamps
    end
  end
end
