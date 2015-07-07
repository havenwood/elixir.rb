require 'test_helper'

describe Elixir::Float do
  describe 'ceil' do
    it 'returns the ceiling' do
      assert_equal 35.0, Elixir::Float.ceil(34.25)
      assert_equal -56.0, Elixir::Float.ceil(-56.5)
    end
  end

  describe 'floor' do
    it 'returns the floor' do
      assert_equal 34.0, Elixir::Float.floor(34.25)
      assert_equal -57, Elixir::Float.floor(-56.5)
    end
  end

  describe 'parse' do
    it 'returns :error unless it starts with a digit' do
      assert_equal :error, Elixir::Float.parse('x0')
      assert_equal :error, Elixir::Float.parse('.1')
    end

    it 'returns [Float, ''] when only a Float' do
      assert_equal [0.0, ''], Elixir::Float.parse('0')
      assert_equal [6.28, ''], Elixir::Float.parse('6.28')
    end

    it 'return [Float, text] when text follows a valid Float' do
      assert_equal [0.0, 'xoxo'], Elixir::Float.parse('0xoxo')
      assert_equal [6.28, '!'], Elixir::Float.parse('6.28!')
      assert_equal [6.28, '.6.28'], Elixir::Float.parse('6.28.6.28')
    end
  end

  describe 'round' do
    it 'rounds' do
      assert_equal 5.567, Elixir::Float.round(5.5674, 3)
      assert_equal 5.568, Elixir::Float.round(5.5675, 3)
      assert_equal -5.567, Elixir::Float.round(-5.5674, 3)
      assert_equal -5.568, Elixir::Float.round(-5.5675, 3)
    end
  end

  describe 'to_char_list' do
    it ''
  end

  describe 'to_string' do
    it ''
  end
end
