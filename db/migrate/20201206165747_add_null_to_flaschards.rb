class AddNullToFlaschards < ActiveRecord::Migration[6.0]
  def change
    change_column_null :chapters, :name, false

    change_column_null :flashcards, :question, false
    change_column_null :flashcards, :answer, false

    change_column_null :missions, :name, false

    change_column_null :profiles, :first_name, false
    change_column_null :profiles, :last_name, false
    change_column_null :profiles, :gender, false

    change_column_null :subjects, :name, false


  end
end
