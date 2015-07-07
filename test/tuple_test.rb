require 'test_helper'

describe Elixir::Tuple do
  before do
    @list = [:a, :b, :c]
  end

  describe 'delete_at' do
    it 'returns an Array without the deleted index' do
      assert_equal [:a, :c], Elixir::Tuple.delete_at(@list, 1)
    end
  end

  describe 'duplicate' do
    it 'duplicates to a given size' do
      assert_equal [:ok, :ok, :ok], Elixir::Tuple.duplicate(:ok, 3)
    end
  end

  describe 'insert_at' do
    it 'returns an Array with the item inserted at index' do
      assert_equal [:a, :x, :b, :c], Elixir::Tuple.insert_at(@list, 1, :x)
    end
  end

  describe 'to_list' do
    it 'returns an Array' do
      assert_equal @list, Elixir::Tuple.to_list(@list)
    end
  end
end
