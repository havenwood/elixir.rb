require 'test_helper'

describe Elixir::Atom do
  describe 'to_char_list' do
    it 'returns an empty Array when empty' do
      assert_equal [], Elixir::Atom.to_char_list('')
    end

    it 'returns an Array of chars' do
      assert_equal ['R', '2', 'D', '2'], Elixir::Atom.to_char_list('R2D2')
      assert_equal ['1', ' ', '+', ' ', '1'], Elixir::Atom.to_char_list('1 + 1')
    end
  end

  describe 'to_string' do
    it 'returns an empty String when empty' do
      assert_equal '', Elixir::Atom.to_string(:'')
    end

    it 'returns a String' do
      assert_equal 'xoxo', Elixir::Atom.to_string(:xoxo)
      assert_equal 'a space', Elixir::Atom.to_string(:'a space')
    end
  end
end
