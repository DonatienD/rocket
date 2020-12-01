class CreateAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :accesses do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
