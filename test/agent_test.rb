require 'test_helper'

describe Elixir::Agent do
  before do
    _, @integer = Elixir::Agent.start { 0 }
    _, @array = Elixir::Agent.start { [] }
  end

  describe 'cast' do
    it 'tries to set a value' do
      assert_equal :ok, Elixir::Agent.cast(@integer) { |n| n + 1 }
      assert_equal :ok, Elixir::Agent.cast(@array) { |n| n.reverse }
    end
  end

  describe 'get' do
    it 'gets a value' do
      assert_equal 0, Elixir::Agent.get(@integer, &:itself)
      assert_equal [], Elixir::Agent.get(@array) { |n| n }
    end

    it 'gets an incremented value' do
      assert_equal 1, Elixir::Agent.get(@integer, &:next)
      assert_equal 1, Elixir::Agent.get(@integer) { |n| n.next }
    end
  end

  describe 'get_and_update' do
    it 'gets last value and sets new value' do
      assert_equal 0, Elixir::Agent.get_and_update(@integer, &:next)
      assert_equal 1, Elixir::Agent.get(@integer, &:itself)
    end
  end

  describe 'start' do
    it 'returns :ok and the Agent' do
      ok, _ = Elixir::Agent.start {}

      assert_equal :ok, ok
    end
  end

  describe 'update' do
    it 'returns :ok after setting the value' do
      assert_equal :ok, Elixir::Agent.update(@integer) { |n| n + 1 }
      assert_equal 1, Elixir::Agent.get(@integer, &:itself)
    end
  end


end
