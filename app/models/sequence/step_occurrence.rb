class Sequence::StepOccurrence < ApplicationRecord
  belongs_to :sequence_step, class_name: "Sequence::Step"
  belongs_to :sequence_subscription, class_name: "Sequence::Subscription"

  scope :processable, -> {
    joins(
      :sequence_step,
      :sequence_subscription
    ).where(
      "(sequence_subscriptions.created_at + make_interval(days := sequence_steps.wait::INTEGER)) >= TIMESTAMP :now  and sequence_step_occurrences.is_sent = false",
      {
        now: Time.now.utc
      }
    )
  }

end
