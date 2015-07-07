require 'concurrent'

module Elixir
  module Agent
    module_function

    def cast agent, &fun
      agent.try_update do |value|
        ->{ fun.call value.call }
      end

      :ok
    end

    def get agent, &fun
      fun.call agent.get.call
    end

    def get_and_update agent, &fun
      old_lambda = agent.get
      old_value = old_lambda.call
      new_lambda = ->{ fun.call old_value }
      agent.compare_and_set old_lambda, new_lambda

      old_value
    end

    def start &fun
      [:ok, Concurrent::Atomic.new(fun)]
    end

    def update agent, &fun
      agent.update do |value|
        ->{ fun.call value.call }
      end

      :ok
    end

    # TODO: Timeouts and explain what's lacking in the Ruby implementation.
  end
end
