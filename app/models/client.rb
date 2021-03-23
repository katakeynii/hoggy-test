class Client < ApplicationRecord
    has_many :sequence_subscriptions, as: :user, class_name: "Sequence::Subscription"
    has_many :sequence_definitions, through: :sequence_subscriptions, class_name: "Sequence::Subscription"

    rails_admin do 
        object_label_method do 
            :email
        end
    end
end
