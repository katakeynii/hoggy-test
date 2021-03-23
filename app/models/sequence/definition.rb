class Sequence::Definition < ApplicationRecord
    has_many :sequence_steps, class_name: "Sequence::Step", foreign_key: 'sequence_definition_id'
    has_many :sequence_subscriptions, class_name: "Sequence::Subscription", foreign_key: 'sequence_definition_id'
    # has_many :clients, through: :sequence_subscriptions, source: :user, source_type: "Client", class_name: "Client"
    validates_presence_of :name, on: :create, message: "can't be blank"
    
    rails_admin do
        edit do
            field :name
        end
    end
end
