require 'test_helper'

describe Elixir::Range do
  describe 'new' do
    it 'creates a new Range' do
      assert_kind_of ::Range, Elixir::Range.new(0, 10)
    end
  end

  describe 'range?' do
    it 'returns true when a range' do
      assert Elixir::Range.range? 0..10
    end

    it 'returns false when not a range' do
      refute Elixir::Range.range? 0
    end
  end
end
