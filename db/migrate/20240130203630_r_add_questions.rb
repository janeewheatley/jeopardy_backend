class RAddQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :user_answer, :string
    add_column :questions, :clue, :string
  end
end
