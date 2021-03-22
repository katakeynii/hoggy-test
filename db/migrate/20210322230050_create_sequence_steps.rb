class CreateSequenceSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :sequence_steps do |t|
      t.integer :wait
      t.string :name
      t.references :sequence_definition, null: false, foreign_key: true
      t.text :mail_content
      t.string :mail_subject

      t.timestamps
    end
  end
end
