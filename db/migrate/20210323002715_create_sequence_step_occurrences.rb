class CreateSequenceStepOccurrences < ActiveRecord::Migration[6.1]
  def change
    create_table :sequence_step_occurrences do |t|
      t.datetime :sent_at
      t.boolean :is_sent
      t.references :sequence_step, null: false, foreign_key: true
      t.references :sequence_subscription, null: false, foreign_key: true

      t.timestamps
    end
    add_index :sequence_step_occurrences, [:sequence_subscription_id, :sequence_step_id], unique: true, name: :user_sequence_step_subscription_idx
  end
end
