class Client < ApplicationRecord
    has_many :sequence_subscriptions, as: :user
    has_many :sequence_definitions, through: :sequence_subscriptions
end
