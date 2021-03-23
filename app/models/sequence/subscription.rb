class Sequence::Subscription < ApplicationRecord
  belongs_to :sequence_definition, class_name: "Sequence::Definition", foreign_key: 'sequence_definition_id'
  belongs_to :sequence_step, class_name: "Sequence::Step", foreign_key: 'sequence_step_id'
  belongs_to :user, polymorphic: true
end
