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

  describe 'count' do
    it 'counts' do
      assert_equal 4, Elixir::Enum.count(@list)
    end
  end
end

# chunk
# chunk_by
# concat
# drop 
# drop_while
# empty?
# fetch
# fetch!
# filter
# filter_map
# find
# find_index
# find_value
# flat_map
# flat_map_reduce
# group_by
# intersperse
# into
# join
# map
# map_join
# map_reduce
# max
# max_by
# member?
# min
# min_by
# partition
# reduce
# reject
# reverse
# scan
# shuffle
# slice
# sort
# sort_by
# split
# split_while
# sum
# take
# take_every
# take_while
# to_list
# uniq
# with_index
# zip
