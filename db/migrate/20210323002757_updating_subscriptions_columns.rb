class UpdatingSubscriptionsColumns < ActiveRecord::Migration[6.1]
  def change


    remove_column :sequence_subscriptions, :sent_at, :datetime
    remove_column :sequence_subscriptions, :is_sent, :boolean, default: false
    remove_reference :sequence_subscriptions, :sequence_step
    
  end
end
