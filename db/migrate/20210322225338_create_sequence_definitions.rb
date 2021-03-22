class CreateSequenceDefinitions < ActiveRecord::Migration[6.1]
  def change
    create_table :sequence_definitions do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
