require 'concurrent/async'
require 'concurrent/executor/fixed_thread_pool'

module Elixir
  module Task
    POOL = Concurrent::FixedThreadPool.new Concurrent.processor_count + 2

    module_function

    def async &fun
      fun.extend Concurrent::Async
      fun.init_mutex

      fun.async.call
    end

    def await task, timeout = 5000
      value = task.value timeout / 1000
      task.fail && raise(StandardError, 'time out') if task.pending?

      value
    end

    def start &fun
      POOL << fun
    end

    # TODO: Explain Ruby implementation limitations and add other Task module functions.
  end
end
