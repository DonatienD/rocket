class CreateMatieres < ActiveRecord::Migration[6.0]
  def change
    create_table :matieres do |t|
      t.string :name

      t.timestamps
    end
  end
end
