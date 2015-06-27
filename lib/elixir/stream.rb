module Elixir
  module Stream
    module_function

    def cycle collection
      collection.cycle
    end

    def interval milliseconds
      Enumerator.new Float::INFINITY do |yielder|
        0.upto Float::INFINITY do |n|
          sleep milliseconds.fdiv 1000
          yielder << n
        end
      end
    end

    def iterate value
      Enumerator.new Float::INFINITY do |yielder|
        loop do
          yielder << value
          value = yield value
        end
      end
    end

    def repeatedly
      Enumerator.new Float::INFINITY do |yielder|
        loop do
          yielder << yield
        end
      end
    end

    def timer milliseconds
      Enumerator.new 1 do |yielder|
        sleep milliseconds.fdiv 1000
        yielder << 0
      end
    end

    def unfold tuple
      Enumerator.new Float::INFINITY do |yielder|
        loop do
          value, tuple = yield tuple
          yielder << value
        end
      end
    end
  end
end
