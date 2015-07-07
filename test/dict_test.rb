require 'test_helper'

describe Elixir::Dict do
  describe 'delete' do
    before do
      @list = [:a, :b, :c]
    end

    it 'returns the Array without the element' do
      assert_equal [:b, :c], Elixir::Dict.delete(@list, :a)
      assert_equal [:c], Elixir::Dict.delete(@list, :b) 
      assert_equal [], Elixir::Dict.delete(@list, :c)
    end
  end

  describe 'equal?' do
    it 'returns true when both empty' do
      assert Elixir::Dict.equal?([], [])
    end

    it 'returns true when both identical' do
      assert Elixir::Dict.equal?([:a, :b], [:a, :b])
    end

    it 'returns false when order varies' do
      refute Elixir::Dict.equal?([:b, :a], [:a, :b])
    end
  end

  describe 'fetch' do
    it 'returns value when key exists' do
      assert_equal 'a', Elixir::Dict.fetch({a: 'a', b: 'b'}, :a)
      assert_equal 'b', Elixir::Dict.fetch({a: 'a', b: 'b'}, :b)
    end

    it 'returns nil when no key exists' do
      assert_nil Elixir::Dict.fetch({a: 'a', b: 'b'}, :c)
    end
  end

  describe 'fetch!' do
    it 'returns value when key exists' do
      assert_equal 'a', Elixir::Dict.fetch({a: 'a', b: 'b'}, :a)
      assert_equal 'b', Elixir::Dict.fetch({a: 'a', b: 'b'}, :b)
    end

    it 'raises when no key exists' do
      assert_raises(ArgumentError) { Elixir::Dict.fetch!({a: 'a', b: 'b'}, :c) }
    end
  end


end
