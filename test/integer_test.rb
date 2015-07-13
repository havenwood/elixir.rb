require 'test_helper'

describe Elixir::Integer do
  describe 'is_even' do
    it 'raises when not Integer' do
      assert_raises { Elixir::Integer.is_even 'x' }
      assert_raises { Elixir::Integer.is_even 'x509' }
      assert_raises { Elixir::Integer.is_even '3.14' }
    end

    it 'returns true when even' do
      assert Elixir::Integer.is_even 0
      assert Elixir::Integer.is_even 2
    end

    it 'returns false when odd' do
      refute Elixir::Integer.is_even 1
      refute Elixir::Integer.is_even 3
    end
  end

  describe 'is_odd' do
    it 'raises when not Integer' do
      assert_raises { Elixir::Integer.is_odd 'x' }
      assert_raises { Elixir::Integer.is_odd 'x509' }
      assert_raises { Elixir::Integer.is_odd '3.14' }
    end

    it 'returns true when odd' do
      assert Elixir::Integer.is_odd 1
      assert Elixir::Integer.is_odd 3
    end

    it 'returns false when even' do
      refute Elixir::Integer.is_odd 0
      refute Elixir::Integer.is_odd 2
    end
  end

  describe 'parse' do
    it 'returns :errror unless signed or unsigned digits' do
      assert_equal :error, Elixir::Integer.parse('x509')
      assert_equal :error, Elixir::Integer.parse('-+509')
    end

    it 'returns an Integer and empty String when digits' do
      assert_equal [42, ''], Elixir::Integer.parse('42')
    end

    it 'returns an Integer and emtpy String when signed digits' do
      assert_equal [42, ''], Elixir::Integer.parse('+42')
      assert_equal [-42, ''], Elixir::Integer.parse('-42')
    end

    it 'returns an Integer and remainder' do
      assert_equal [42, '.0'], Elixir::Integer.parse('42.0')
      assert_equal [42, 'x'], Elixir::Integer.parse('42x')
    end
  end

  describe 'to_char_list' do
    it 'raises when not Integer' do
      assert_raises { Elixir::Integer.to_char_list 'x' }
      assert_raises { Elixir::Integer.to_char_list 'x509' }
      assert_raises { Elixir::Integer.to_char_list '3.14' }
    end

    it 'returns an Array of chars' do
      assert_equal ['0'], Elixir::Integer.to_char_list(0)
      assert_equal ['4', '2'], Elixir::Integer.to_char_list(42)
    end

    it 'returns binary when base 2' do
      assert_equal ['0'], Elixir::Integer.to_char_list(0, 2)
      assert_equal '101010'.chars, Elixir::Integer.to_char_list(42, 2)
    end
  end

  describe 'to_string' do
    it 'raises when not Integer' do
      assert_raises { Elixir::Integer.to_string 'x' }
      assert_raises { Elixir::Integer.to_string 'x509' }
      assert_raises { Elixir::Integer.to_string '3.14' }
    end

    it 'returns a String when an Integer' do
      assert_equal '0', Elixir::Integer.to_string(0)
      assert_equal '42', Elixir::Integer.to_string(42)
    end

    it 'returns binary when base 2' do
      assert_equal '0', Elixir::Integer.to_string(0, 2)
      assert_equal '101010', Elixir::Integer.to_string(42, 2)
    end
  end
end
