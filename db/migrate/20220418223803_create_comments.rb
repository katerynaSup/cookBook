class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.text :comment
      t.integer :commenter_id

      t.timestamps
    end
  end
end
