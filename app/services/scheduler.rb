class Scheduler
    class << self 
        def run
            Sequence::StepOccurrence.processable.each do |occurrence|
                
                step = occurrence.sequence_step
                user = occurrence.sequence_subscription.user
                send_date = occurrence.sequence_subscription.created_at + step.wait.days
                period = (send_date - DateTime.now).to_f.seconds
                SequenceMailer.with(occurrence).dispatch.deliver_later(wait: period ) 
                
            end 
        end
    end
end