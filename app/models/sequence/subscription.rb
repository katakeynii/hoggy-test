class Sequence::Subscription < ApplicationRecord
  after_create :create_occurences

  belongs_to :sequence_definition, class_name: "Sequence::Definition", foreign_key: 'sequence_definition_id'
  belongs_to :user, polymorphic: true



  def create_occurences
    self.sequence_definition.sequence_steps.each do |step|
      Sequence::StepOccurrence.create! do |occ|
        occ.is_sent = false 
        occ.sequence_step = step
        occ.sequence_subscription = self
      end
    end
    Scheduler.run
  end

  rails_admin do
    object_label_method do
      :custom_label_method
    end
    edit do
        field :sequence_definition
        field :user
    end
  end

  def custom_label_method
    definition = self&.sequence_definition&.name 
    user = self&.user&.email 
    "#{definition} ->  #{user}"
  end
end
