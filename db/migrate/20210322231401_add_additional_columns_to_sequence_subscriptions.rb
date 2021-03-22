class AddAdditionalColumnsToSequenceSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :sequence_subscriptions, :sent_at, :datetime
    add_column :sequence_subscriptions, :is_sent, :boolean, default: false
    add_reference :sequence_subscriptions, :sequence_step
    
    remove_index :sequence_subscriptions, name: "user_sequence_definition_idx"
    add_index :sequence_subscriptions, [:user_type, :user_id, :sequence_definition_id, :sequence_step_id], unique: true, name: :user_sequence_def_and_step_idx
  end
end
