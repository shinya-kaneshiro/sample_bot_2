class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :correct
      t.integer :proficiency

      t.timestamps
    end
  end
end
