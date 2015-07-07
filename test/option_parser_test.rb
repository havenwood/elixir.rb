require 'test_helper'

describe Elixir::OptionParser do
  describe 'next' do
    it ''
  end

  describe 'parse_head' do
    it 'parses an empty Array' do
      opts = [{}, [], {}]
      assert_equal opts, Elixir::OptionParser.parse_head([])
    end

    it 'parses long flags' do
      opts = [{long: true}, [], {}]
      assert_equal opts, Elixir::OptionParser.parse_head(['--long'])
    end

    it 'parses long flags with values' do
      opts = [{long: 'value'}, [], {}]
      assert_equal opts, Elixir::OptionParser.parse_head(['--long', 'value'])
    end

    it 'stops parsing upon encountering a non-flag' do
      opts = [{}, ['extra', '--long'], {}]
      assert_equal opts, Elixir::OptionParser.parse_head(['extra', '--long'])
    end
  end

  describe 'parse' do
    it 'parses an empty Array' do
      opts = [{}, [], {}]
      assert_equal opts, Elixir::OptionParser.parse([])
    end

    it 'parses long flags' do
      opts = [{long: true}, [], {}]
      assert_equal opts, Elixir::OptionParser.parse(['--long'])
    end

    it 'parses long flags with values' do
      opts = [{long: 'value'}, [], {}]
      assert_equal opts, Elixir::OptionParser.parse(['--long', 'value'])
    end

    it 'keeps parsing upon encountering a non-flag' do
      opts = [{long: true}, ['extra'], {}]
      assert_equal opts, Elixir::OptionParser.parse(['extra', '--long'])
    end
  end

  describe 'split' do
    it 'splits and empty string' do
      assert_equal [], Elixir::OptionParser.split('')
    end

    it 'splits short flags' do
      assert_equal ['-la'], Elixir::OptionParser.split('-la')
      assert_equal ['-l', '-a'], Elixir::OptionParser.split('-l -a')
    end

    it 'splits long flags' do
      assert_equal ['--long'], Elixir::OptionParser.split('--long')
      assert_equal ['--long', '--xo'], Elixir::OptionParser.split('--long --xo')
    end

    it 'splits long flags with values' do
      assert_equal ['--long', 'value'], Elixir::OptionParser.split('--long value')
    end
  end

  describe 'to_argv' do
    it 'returns a String from a Hash of arguments' do
      assert_equal ['--on'], Elixir::OptionParser.to_argv({on: true})
      assert_equal ['--state', 'on'], Elixir::OptionParser.to_argv({state: 'on'})
      assert_equal ['--on', '--state', 'on'], Elixir::OptionParser.to_argv({on: true, state: 'on'})
    end
  end
end
