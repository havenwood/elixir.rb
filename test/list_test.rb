require 'test_helper'

describe Elixir::List do
  describe 'delete_at' do
    it 'returns an Array without the deleted index' do
      assert_equal [:a, :c], Elixir::List.delete_at([:a, :b, :c], 1)
    end

    it 'does not modify the original Array' do
      list = %i[a b c]

      assert_equal [:a, :c], Elixir::List.delete_at(list, 1)
      assert_equal %i[a b c], list
    end
  end

  describe 'duplicate' do
    it 'duplicates to a given size' do
      assert_equal [:ok, :ok, :ok], Elixir::List.duplicate(:ok, 3)
    end
  end

  describe 'first' do
    it 'returns the first item' do
      assert_equal :a, Elixir::List.first([:a, :b, :c])
    end
  end

  describe 'flatten' do
    it 'returns unaltered when already flat' do
      assert_equal [], Elixir::List.flatten([])
      assert_equal [1, 2], Elixir::List.flatten([1, 2])
    end

    it 'flattens one level' do
      assert_equal [], Elixir::List.flatten([[], []])
      assert_equal [1, 2], Elixir::List::flatten([[1], [2]])
    end

    it 'flattens multiple levels' do
      assert_equal [], Elixir::List.flatten([[[]], [[]]])
      assert_equal [1, 2], Elixir::List.flatten([[[1]], [[2]]])
    end

    it 'appends an optional tail' do
      assert_equal [:tail], Elixir::List.flatten([[]], [:tail])
      assert_equal [1, 2, 3, 4], Elixir::List.flatten([[1], [2]], [3, 4])
    end
  end

  describe 'foldl' do
    it 'folds to the left with a block into an accumulator' do
      assert_equal 20, Elixir::List.foldl([5, 5], 10) { |x, acc| x + acc }
      assert_equal 2, Elixir::List.foldl([1, 2, 3, 4], 0) { |x, acc| x - acc }
    end
  end

  describe 'foldr' do
    it 'folds to the right with a block into an accumulator' do
      assert_equal -2, Elixir::List.foldr([1, 2, 3, 4], 0) { |x, acc| x - acc }
    end
  end

  describe 'insert_at' do
    it 'inserts an item at an index' do
      assert_equal [0], Elixir::List.insert_at([], 0, 0)
      assert_equal [0, 1, 2], Elixir::List.insert_at([1, 2], 0, 0)
      assert_equal [0, 1, 2], Elixir::List.insert_at([0, 2], 1, 1)
      assert_equal [0, 1, 2], Elixir::List.insert_at([0, 1], 2, 2)
    end
  end

  describe 'keydelete' do
    it ''
  end

  describe 'keyfind' do
    it ''
  end

  describe 'keymember?' do
    it ''
  end

  describe 'keyreplace' do
    it ''
  end

  describe 'keysort' do
    it ''
  end

  describe 'last' do
    it 'returns the last item' do
    end
  end

  describe 'replace_at' do
    it ''
  end

  describe 'to_atom' do
    it ''
  end

  describe 'to_existing_atom' do
    it ''
  end

  describe 'to_float' do
    it ''
  end

  describe 'to_integer' do
    it ''
  end

  describe 'to_string' do
    it ''
  end

  describe 'to_tuple' do
    it 'returns an unaltered Array' do
      assert_equal [], Elixir::List.to_tuple([])
      assert_equal [1, 2, 3], Elixir::List.to_tuple([1, 2, 3])
    end
  end

  describe 'update_at' do
    it ''
  end

  describe 'wrap' do
    it 'returns an unaltered Array from an Array' do
      assert_equal [], Elixir::List.to_tuple([])
      assert_equal [1, 2, 3], Elixir::List.to_tuple([1, 2, 3])
    end

    it 'returns an Array containing a non-Array' do
      assert_equal [:a], Elixir::List.wrap(:a)
      assert_equal [0], Elixir::List.wrap(0)
    end
  end

  describe 'zip' do
    it 'transposes an Array of Arrays' do
      assert_equal [[1, 4], [2, 5], [3, 6]], Elixir::List.zip([[1, 2, 3], [4, 5, 6]])
      assert_equal [[1, 3, 5], [2, 4, 6]], Elixir::List.zip([[1, 2], [3, 4], [5, 6]])
    end

    it 'transposes only as many as the smallest Array' do
      assert_equal [[1, 3, 5]], Elixir::List.zip([[1, 2], [3], [5, 6]])
    end
  end
end
