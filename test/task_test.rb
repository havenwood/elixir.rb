require 'test_helper'

describe Elixir::Task do
  describe 'async' do
    it 'starts an asynchronous task that can be awaited on' do
      assert Elixir::Task.async { 1 + 1 }
    end
  end

  describe 'await' do
    before do
      @task = Elixir::Task.async { 1 + 1 }
    end

    it 'awaits a task reply' do
      assert_equal 2, Elixir::Task.await(@task)
    end
  end

  describe 'start' do
    it 'starts an asyncronous task for side-effects' do
      assert Elixir::Task.async { :side_effects }
    end
  end
end
