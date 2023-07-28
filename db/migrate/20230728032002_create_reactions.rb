class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.references :post, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :kind
      t.string :reaction_type
      t.references :comment, null: true, foreign_key: true

      t.timestamps
    end
  end
end
