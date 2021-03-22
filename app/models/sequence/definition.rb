class Sequence::Definition < ApplicationRecord
    has_many :sequence_subscriptions
    has_many :clients, through: :sequence_subscriptions
end
