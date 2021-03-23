class MiddlewareStack
    attr_reader :middlewares 

    def initialize
      @middlewares = [
          :middleware,
          :stop_on_sequence2
      ]
    end
    def middleware occurrence
        true
    end

    def stop_on_sequence2 occurrence
        
        slug = occurrence&.sequence_subscription&.sequence_definition&.slug
        if slug.eql?("completion-demane")
            presence = occurrence&.sequence_subscription&.user&.demand_description
            presence.blank?
        else
            true
        end
    end

    def run(occurrence)
        @middlewares.each do |middleware|
            return false if self.send(middleware, occurrence).eql?(false)
        end
        true
    end
end