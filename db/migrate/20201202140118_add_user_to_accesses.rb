class AddUserToAccesses < ActiveRecord::Migration[6.0]
  def change
    remove_reference :accesses, :profile
    add_reference :accesses, :user, foreign_key: true, null: false
    add_reference :rooms, :user, foreign_key: true, null: false
    add_reference :chapters, :user, foreign_key: true, null: false
    add_reference :missions, :user, foreign_key: true, null: false
    add_reference :flashcards, :user, foreign_key: true, null: false
  end
end
