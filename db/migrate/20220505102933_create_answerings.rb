class CreateAnswerings < ActiveRecord::Migration[6.1]
  def change
    create_table :answerings do |t|
      t.integer :answering_id

      t.timestamps
    end
  end
end
