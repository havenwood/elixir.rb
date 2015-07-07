require 'test_helper'

describe Elixir::Set do
  describe 'delete' do
    it 'deletes the item' do
      set = Set.new([1, 2, 3])
      Elixir::Set.delete(set, 2)

      refute_includes set, 2
    end
  end

  describe 'difference' do
    it 'returns empty when different' do
      assert_equal Set.new, Elixir::Set.difference(Set.new, Set.new)
      assert_equal Set.new, Elixir::Set.difference(Set.new([:x, :y]), Set.new([:x, :y]))
    end

    it 'returns the difference when different' do
      assert_equal Set.new([:b]), Elixir::Set.difference(Set.new([:a, :b]), Set.new([:a]))
    end
  end

  describe 'disjoint?' do
    it 'checks if there are no members in common' do
      assert Elixir::Set.disjoint? Set.new([1, 2]), Set.new([3, 4])
      refute Elixir::Set.disjoint? Set.new([1, 2]), Set.new([2, 3])
    end
  end

  describe 'equal?' do
    it 'checks if it is equal' do
      assert Elixir::Set.equal? Set.new([1, 2]), Set.new([2, 1, 1])
      refute Elixir::Set.equal? Set.new([1, 2]), Set.new([3, 4])
    end
  end

  describe 'intersection' do
    it 'returns a Set containing only the intersection' do
      assert_equal Set.new([2, 3]), Elixir::Set.intersection(Set.new([1, 2, 3]), Set.new([2, 3, 4]))
      assert_equal Set.new([]), Elixir::Set.intersection(Set.new([1, 2]), Set.new([3, 4]))
    end
  end

  describe 'member?' do
    it 'checks if Set contains item' do
      assert Elixir::Set.member?(Set.new([1, 2, 3]), 2)
      refute Elixir::Set.member?(Set.new([1, 2, 3]), 4)
    end
  end

  describe 'put' do
    it 'inserts an item' do
      set = Set.new
      Elixir::Set.put set, :stuff

      assert_equal Set.new([:stuff]), set
    end
  end

  describe 'size' do
    it 'returns the size' do
      assert_equal 0, Elixir::Set.size(Set.new([]))
      assert_equal 3, Elixir::Set.size(Set.new([1, 2, 3]))
    end
  end

  describe 'subset?' do
    it 'checks if it is a subset' do
      assert Elixir::Set.subset? Set.new([1, 2]), Set.new([1, 2, 3])
      refute Elixir::Set.subset? Set.new([1, 2, 3]), Set.new([1, 2])
    end
  end

  describe 'to_list' do
    it 'returns an Array' do
      assert_equal [], Elixir::Set.to_list(Set.new([]))
      assert_equal [1, 2, 3], Elixir::Set.to_list(Set.new([1, 2, 3]))
    end
  end

  describe 'union' do
    it 'returns a Set containing the union of two Sets' do
      assert_equal Set.new([1, 2, 3, 4]), Elixir::Set.union(Set.new([1, 2]), Set.new([2, 3, 4]))
    end
  end
end
