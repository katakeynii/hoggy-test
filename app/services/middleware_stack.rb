class MiddlewareStack
    attr_reader :middleware 

    def initialize
      @middleware = [
          :middleware,
          :middleware2
      ]
    end
    def middleware occurrence
        true
    end

    def stop_on_sequence2 occurrence
        presence = occurrence&.sequence_subscription&.user&.demand_description
        presence.nil?
    end

    def run(occurrence)
        @middlewares.each do |middleware|
            return false if self.send(middleware, occurrence).eql?(false)
        end
        true
    end
end