class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :api_id
      t.integer :game_id
      t.boolean :correct

      t.timestamps
    end
  end
end
