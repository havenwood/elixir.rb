require 'test_helper'

describe Elixir::Stream do
  INFINITY = Float::INFINITY

  describe 'cycle' do
    before do
      @cycle = Elixir::Stream.cycle [1, 2, 3]
    end

    it 'is infinite' do
      assert_equal INFINITY, @cycle.size
    end

    it 'cycles' do
      assert_equal [1, 2, 3, 1, 2], @cycle.take(5)
    end
  end

  describe 'interval' do
    before do
      @interval = Elixir::Stream.interval(100) { :ok }
    end
  
    it 'is infinite' do
      assert_equal INFINITY, @interval.size
    end
  end

  describe 'iterate' do
    before do
      @iterate = Elixir::Stream.iterate 0, &:next
    end

    it 'is infinite' do
      assert_equal INFINITY, @iterate.size
    end

    it 'iterates' do
      assert_equal [0, 1, 2, 3, 4], @iterate.take(5)
    end
  end

  describe 'repeatedly' do
    before do
      @repeatedly = Elixir::Stream.repeatedly { 0 }
    end

    it 'is infinite' do
      assert_equal INFINITY, @repeatedly.size
    end

    it 'repeats' do
      assert_equal [0, 0, 0, 0, 0], @repeatedly.take(5)
    end
  end

  describe 'timer' do
    before do
      @timer = Elixir::Stream.timer(100) { :ok }
    end
  
    it 'is solo' do
      assert_equal 1, @timer.size
    end
  end

  describe 'unfold' do
    before do
      @unfold = Elixir::Stream.unfold [0, 1] do |a, b|
        [a, [b, a + b]]
      end
    end

    it 'is infinite' do
      assert_equal INFINITY, @unfold.size
    end

    it 'is the Fibonacci Sequence' do
      assert_equal [0, 1, 1, 2, 3], @unfold.take(5)
    end
  end


end
