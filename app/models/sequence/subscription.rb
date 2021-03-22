class Sequence::Subscription < ApplicationRecord
  belongs_to :sequence_definition
  belongs_to :user, polymorphic: true
end
