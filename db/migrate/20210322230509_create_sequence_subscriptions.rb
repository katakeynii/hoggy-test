class CreateSequenceSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :sequence_subscriptions do |t|
      t.references :sequence_definition, null: false, foreign_key: true
      t.references :user, polymorphic: true, null: false

      t.timestamps
    end
    add_index :sequence_subscriptions, [:user_type, :user_id, :sequence_definition_id], unique: true, name: :user_sequence_definition_idx
  end
end
