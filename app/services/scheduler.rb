class ClassName
    class << self 
        def run
            Sequence::StepOccurrence.processable.each do |occurrence|
                should_run = MiddlewareStack.new.run(occurrence)
            end 
        end
    end
end