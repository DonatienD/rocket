class CreateFlashcards < ActiveRecord::Migration[6.0]
  def change
    create_table :flashcards do |t|
      t.references :mission, null: false, foreign_key: true
      t.text :question
      t.text :answer
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
