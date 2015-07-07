require 'test_helper'

describe Elixir::Enum do
  before do
    @list = [1, 2, 2, 3]
  end

  describe 'all?' do
    it 'is true when all' do
      assert Elixir::Enum.all?(@list) { |n| n < 4 }
    end

    it 'is false when not all' do
      refute Elixir::Enum.all?(@list) { |n| n < 3 }
    end
  end

  describe 'any?' do
    it 'is true when any' do
      assert Elixir::Enum.any?(@list, &:odd?)
    end

    it 'is false when not any' do
      refute Elixir::Enum.any?(@list, &:zero?)
    end
  end

  describe 'at' do
    it 'gets from the beginning' do
      assert_equal 1, Elixir::Enum.at(@list, 0)
    end

    it 'gets from the middle' do
      assert_equal 2, Elixir::Enum.at(@list, 2)
    end

    it 'gets from the end' do
      assert_equal 3, Elixir::Enum.at(@list, 3)
    end
  end

  describe 'chunk' do
    it 'chunks'
  end

  describe 'chunk_by' do
    it 'returns an Array of chunks' do
      assert_equal [[1], [2, 2], [3]], Elixir::Enum.chunk_by(@list, &:odd?)
      assert_equal [[1, 2, 2], [3]], Elixir::Enum.chunk_by(@list) { |n| n > 2 }
    end
  end

  describe 'concat' do
    it 'concatenates collections' do
      assert_equal [1, 2, 2, 3, 1, 2, 2, 3], Elixir::Enum.concat(@list, @list)
    end
  end

  describe 'count' do
    it 'counts' do
      assert_equal 4, Elixir::Enum.count(@list)
    end
  end

  describe 'drop' do
    it 'drops however many' do
      assert_equal [1, 2, 2, 3], Elixir::Enum.drop(@list, 0)
      assert_equal [2, 2, 3], Elixir::Enum.drop(@list, 1)
      assert_equal [], Elixir::Enum.drop(@list, 4)
      assert_equal [], Elixir::Enum.drop(@list, 5)
    end
  end

  describe 'drop_while' do
    it 'drops items while the block value is truthy' do
      assert_equal [3], Elixir::Enum.drop_while(@list) { |n| n < 3 }
      assert_equal [2, 2, 3], Elixir::Enum.drop_while(@list, &:odd?)
      assert_equal [1, 2, 2, 3], Elixir::Enum.drop_while(@list, &:even?)
    end
  end

  describe 'each' do
    before do
      @new_array = []
    end

    it 'iterates over each' do
      return_value = Elixir::Enum.each(@list) { |n| @new_array << n.next }

      assert_equal [2, 3, 3, 4], @new_array
      assert_equal :ok, return_value
    end
  end

  describe 'empty?' do
    it 'returns true if empty and false if not' do
      refute Elixir::Enum.empty? @list
      assert Elixir::Enum.empty? []
    end
  end

  describe 'fetch' do
    it ''
  end

  describe 'fetch!' do
    it ''
  end

  describe 'filter' do
    it 'finds all items that match' do
      assert_equal [1, 3], Elixir::Enum.filter(@list, &:odd?)
      assert_equal [2, 2], Elixir::Enum.filter(@list, &:even?)
      assert_equal [3], Elixir::Enum.filter(@list) { |n| n > 2 }
      assert_equal [1, 2, 2], Elixir::Enum.filter(@list) { |n| n < 3 }
    end
  end

  describe 'filter_map' do
    it ''
  end

  describe 'find' do
    it 'finds the first item for which the block returns truthy' do
      assert_equal 1, Elixir::Enum.find(@list, &:odd?)
      assert_equal 2, Elixir::Enum.find(@list, &:even?)
      assert_equal 3, Elixir::Enum.find(@list) { |n| n > 2 }
    end
  end

  describe 'find_index' do
    it ''
  end

  describe 'find_value' do
    it ''
  end

  describe 'flat_map' do
    it 'maps into a flat Array' do
      assert_equal [:a, :a, :b, :b, :c, :c], Elixir::Enum.flat_map([:a, :b, :c]) { |s| [s, s] }
      assert_equal [1, 1, 2, 2, 3, 3], Elixir::Enum.flat_map([1, 2, 3]) { |s| [s, s] }
    end
  end

  describe 'flat_map_reduce' do
    it ''
  end

  describe 'group_by' do
    it 'groups items by block value' do
      assert_equal({true: [1, 3], false: [2, 2]}, Elixir::Enum.group_by(@list, &:odd?))
    end
  end

  describe 'intersperse' do
    it 'intersperses something after each item' do
      assert_equal [1, 0, 2, 0, 2, 0, 3, 0], Elixir::Enum.intersperse(@list, 0)
    end
  end

  describe 'into' do
    it ''
  end

  describe 'join' do
    it 'joins the items into a String' do
      assert_equal '1223', Elixir::Enum.join(@list)
    end

    it 'joins items with a joiner between' do
      assert_equal '1-2-2-3', Elixir::Enum.join(@list, '-')
      assert_equal '1xo2xo2xo3', Elixir::Enum.join(@list, 'xo')
    end
  end

  describe 'map' do
    it 'iterates over each item, mapping to the return value' do
      assert_equal [2, 3, 3, 4], Elixir::Enum.map(@list, &:next)
      assert_equal ['1', '2', '2', '3'], Elixir::Enum.map(@list, &:to_s)
    end
  end

  describe 'map_join' do
    it 'maps then joins' do
      assert_equal '2334', Elixir::Enum.map_join(@list, &:next)
    end

    it 'joins on a joiner' do
      assert_equal '2*3*3*4', Elixir::Enum.map_join(@list, '*', &:next)
    end
  end

  describe 'map_reduce' do
    it ''
  end

  describe 'max' do
    it 'returns the maximum value' do
      assert_equal 3, Elixir::Enum.max(@list)
      assert_raises { Elixir::Enum.max [] }
    end
  end

  describe 'max_by' do
    it 'returns the maximum block value' do
      assert_equal 3, Elixir::Enum.max_by(@list, &:itself)
      assert_equal 1, Elixir::Enum.max_by(@list) { |n| -n }
    end
  end

  describe 'member?' do
    it 'returns true if a member or false if not' do
      assert Elixir::Enum.member? @list, 2
      refute Elixir::Enum.member? @list, 5
    end
  end

  describe 'min' do
    it 'returns the mininum value' do
      assert_equal 1, Elixir::Enum.min(@list)
      assert_raises { Elixir::Enum.min [] }
    end
  end

  describe 'min_by' do
    it 'finds the minimum block value' do
      assert_equal 1, Elixir::Enum.min_by(@list, &:itself)
      assert_equal 3, Elixir::Enum.min_by(@list) { |n| -n }
    end
  end

  describe 'partition' do
    it 'partitions the items' do
      assert_equal [[2, 2], [1, 3]], Elixir::Enum.partition(@list) { |n| n == 2 }
    end
  end

  describe 'reduce' do
    # TODO: Use the first value to determine the accumulator.
    it 'reduces the items into an accumulator' do
      assert_equal 8, Elixir::Enum.reduce(@list, 0) { |acc, n| acc + n }
    end
  end

  describe 'reject' do
    it 'deletes all items that match' do
      assert_equal [2, 2], Elixir::Enum.reject(@list, &:odd?)
      assert_equal [1, 3], Elixir::Enum.reject(@list, &:even?)
    end
  end

  describe 'reverse' do
    it 'reverses the order' do
      assert_equal [3, 2, 2, 1], Elixir::Enum.reverse(@list)
    end

    it 'reverse the order and appends a tail' do
      assert_equal [3, 2, 2, 1, 0], Elixir::Enum.reverse(@list, 0)
    end
  end

  describe 'scan' do
    it ''
  end

  describe 'shuffle' do
    it 'shuffles the order' do
      feeling_lucky = 1_000
      shuffles = Array.new(feeling_lucky) { Elixir::Enum.shuffle @list }
      originals = Array.new(feeling_lucky, @list)

      refute_equal shuffles, originals
      assert_equal shuffles.map(&:sort), originals
    end
  end

  describe 'slice' do
    it ''
  end

  describe 'sort' do
    it 'sorts' do
      assert_equal @list, Elixir::Enum.sort(@list)
      assert_equal @list, Elixir::Enum.sort([2, 3, 2, 1])
    end
  end

  describe 'sort_by' do
    it ''
  end

  describe 'split' do
    it ''
  end

  describe 'split_while' do
    it ''
  end

  describe 'sum' do
    it 'returns the sum of all the items' do
      assert_equal 8, Elixir::Enum.sum(@list)
    end
  end

  describe 'take' do
    it 'takes n items' do
      assert_equal [], Elixir::Enum.take(@list, 0)
      assert_equal [1], Elixir::Enum.take(@list, 1)
      assert_equal [1, 2], Elixir::Enum.take(@list, 2)
      assert_equal [1, 2, 2], Elixir::Enum.take(@list, 3)
      assert_equal [1, 2, 2, 3], Elixir::Enum.take(@list, 4)
      assert_equal [1, 2, 2, 3], Elixir::Enum.take(@list, 5)
    end
  end

  describe 'take_every' do
    it 'takes every nth item' do
      assert_equal [1, 2, 2, 3], Elixir::Enum.take_every(@list, 1)
      assert_equal [1, 2], Elixir::Enum.take_every(@list, 2)
      assert_equal [1, 3], Elixir::Enum.take_every(@list, 3)
      assert_equal [1], Elixir::Enum.take_every(@list, 4)
    end
  end

  describe 'take_while' do
    it ''
  end

  describe 'to_list' do
    it 'converts to an Array' do
      assert_equal [], Elixir::Enum.to_list([])
      assert_equal @list, Elixir::Enum.to_list(@list)
    end
  end

  describe 'uniq' do
    it 'returns an Array of unique values' do
      assert_equal [], Elixir::Enum.uniq([])
      assert_equal [1, 2, 3], Elixir::Enum.uniq(@list)
    end
  end

  describe 'with_index' do
    it 'returns an Array of each with its index' do
      assert_equal [[1, 0], [2, 1], [2, 2], [3, 3]], Elixir::Enum.with_index(@list)
    end
  end

  describe 'zip' do
    it 'zips' do
      assert_equal [[1, 1], [2, 2], [2, 2], [3, 3]], Elixir::Enum.zip(@list, @list)
      assert_equal [[1, 3], [2, 2], [2, 2], [3, 1]], Elixir::Enum.zip(@list, @list.reverse)
    end
  end
end
