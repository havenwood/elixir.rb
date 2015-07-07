require 'test_helper'

describe Elixir::String do
  describe 'at' do
    it 'returns the character at the given index' do
      assert_equal 't', Elixir::String.at('test', 0)
      assert_equal 's', Elixir::String.at('test', 2)
    end
  end

  describe 'capitalize' do
    it 'leaves already-capitalized unaltered' do
      assert_equal 'Capitalize', Elixir::String.capitalize('Capitalize')
    end

    it 'capitalizes lower-cased' do
      assert_equal 'Lower-case', Elixir::String.capitalize('lower-case')
      assert_equal 'M80', Elixir::String.capitalize('m80')
    end

    it 'capitalizes upper-cased' do
      assert_equal 'Allcaps', Elixir::String.capitalize('ALLCAPS')
    end
  end

  describe 'chunk' do
    it ''
  end

  describe 'codepoints' do
    it 'returns an empty Array when empty' do
      assert_equal [], Elixir::String.codepoints('')
    end

    it 'returns an Array of chars when not empty' do
      assert_equal ['a', 'b', 'c'], Elixir::String.codepoints('abc')
      assert_equal ['1', '2', '3'], Elixir::String.codepoints('123')
    end
  end

  describe 'contains?' do
    it 'returns true when both are empty' do
      $stderr = StringIO.new # silence deprecation notice
      assert Elixir::String.contains? '', ''
      $stderr = STDERR
    end

    it 'returns true when the same' do
      assert Elixir::String.contains? 'jinx', 'jinx'
    end

    it 'returns true when a subset' do
      assert Elixir::String.contains? 'partial', 'p'
      assert Elixir::String.contains? 'partial', 'part'
      assert Elixir::String.contains? 'partial', 'art'
      assert Elixir::String.contains? 'partial', 'l'
    end

    it 'returns false when not a subset' do
      refute Elixir::String.contains? 'partial', 'x'
      refute Elixir::String.contains? 'partial', 'xo'
      refute Elixir::String.contains? 'partial', 'laitrap'
      refute Elixir::String.contains? 'partial', 'trap'
    end
  end

  describe 'downcase' do
    it 'leaves already-downcased unaltered' do
      assert_equal 'downcased', Elixir::String.downcase('downcased')
    end

    it 'downcases mixed-cased' do
      assert_equal 'mixed-case', Elixir::String.downcase('Mixed-Case')
      assert_equal 'an m80', Elixir::String.downcase('an M80')
    end

    it 'downcases upper-cased' do
      assert_equal 'allcaps', Elixir::String.downcase('ALLCAPS')
    end
  end

  describe 'duplicate' do
    it 'returns empty when empty' do
      assert_equal '', Elixir::String.duplicate('', 0)
      assert_equal '', Elixir::String.duplicate('', 42)
    end

    it 'returns empty when duplicated zero times' do
      assert_equal '', Elixir::String.duplicate('xo', 0)
      assert_equal '', Elixir::String.duplicate('y', 0)
    end

    it 'duplicates' do
      assert_equal 'xo', Elixir::String.duplicate('xo', 1)
      assert_equal 'xoxo', Elixir::String.duplicate('xo', 2)
      assert_equal 'xoxoxo', Elixir::String.duplicate('xo', 3)
    end
  end

  describe 'ends_with?' do
    it 'returns true when empty' do
      $stderr = StringIO.new # silence deprecation notice
      assert Elixir::String.ends_with? '', ''
      @stderr = STDERR
    end

    it 'returns true when it ends with' do
      assert Elixir::String.ends_with? 'En fin', 'fin'
    end

    it 'returns false when it does not end with' do
      refute Elixir::String.ends_with? 'En fin', 'En'
    end
  end

  describe 'first' do
    it 'returns nil when empty' do
      assert_nil Elixir::String.first ''
    end

    it 'returns the first character' do
      assert_equal 'a', Elixir::String.first('a')
      assert_equal 'b', Elixir::String.first('bc')
      assert_equal 'c', Elixir::String.first('cde')
    end
  end

  describe 'graphemes' do
    it 'returns an empty Array when empty' do
      assert_equal [], Elixir::String.codepoints('')
    end

    it 'returns an Array of chars when not empty' do
      assert_equal ['a', 'b', 'c'], Elixir::String.graphemes('abc')
      assert_equal ['1', '2', '3'], Elixir::String.graphemes('123')
    end
  end

  describe 'last' do
    it 'returns nil when empty' do
      assert_nil Elixir::String.last ''
    end

    it 'returns the first character' do
      assert_equal 'a', Elixir::String.last('a')
      assert_equal 'c', Elixir::String.last('bc')
      assert_equal 'e', Elixir::String.last('cde')
    end
  end

  describe 'length' do
    it 'returns the size' do
      assert_equal 0, Elixir::String.length('')
      assert_equal 8, Elixir::String.length('elephant')
      assert_equal 3, Elixir::String.length('123')
    end
  end

  describe 'ljust' do
    it 'returns a String of a size that is left justified and padded' do
      assert_equal 'abc  ', Elixir::String.ljust('abc', 5)
      assert_equal 'abc--', Elixir::String.ljust('abc', 5, ?-)
    end
  end

  describe 'lstrip' do
    it 'removes leading whitespace' do
      assert_equal 'abc  ', Elixir::String.lstrip('   abc  ')
    end
  end

  describe 'match?' do
    it 'checks if String matches a Regexp' do
      skip
      assert Elixir::String.match?('foo', /foo/)
      refute Elixir::String.match?('bar', /foo/)
    end
  end

  describe 'next_codepoint' do
    it 'returns the first char and the rest' do
      assert_equal ['o', 'lá'], Elixir::String.next_codepoint('olá')
    end
  end

  describe 'next_grapheme' do
    it 'returns the first char and the rest' do
      assert_equal ['o', 'lá'], Elixir::String.next_codepoint('olá')
    end
  end

  describe 'printable?' do
    it ''
  end

  describe 'replace' do
    it ''
  end

  describe 'reverse' do
    it 'reverses the order' do
      assert_equal 'dcba', Elixir::String.reverse('abcd')
      assert_equal 'dlrow olleh', Elixir::String.reverse('hello world')
      assert_equal 'go∂ olleh', Elixir::String.reverse('hello ∂og')
    end
  end
  
  describe 'rjust' do
    it ''
  end

  describe 'rstrip' do
    it 'removes trailing whitespace'
  end

  describe 'slice' do
    it ''
  end

  describe 'split' do
    it ''
  end

  describe 'split_at' do
    it ''
  end

  describe 'starts_with' do
    it ''
  end

  describe 'strip' do
    it 'removes leading and trailing whitespace'
  end

  describe 'to_atom' do
    it 'returns a Symbol'
  end

  describe 'to_char_list' do
    it 'returns an Array of chars' do
      assert_equal ['a', 'b', 'c'], Elixir::String.to_char_list('abc')
    end
  end

  describe 'to_existing_atom' do
    it 'returns a Symbol if that Symbol already exists'
  end

  describe 'to_float' do
    it 'returns a Float'
  end

  describe 'to_integer' do
    it 'returns an Integer'
  end

  describe 'upcase' do
    it 'leaves already-upcased unaltered' do
      assert_equal 'UPCASED', Elixir::String.upcase('UPCASED')
    end

    it 'downcases mixed-cased' do
      assert_equal 'MIXED-CASE', Elixir::String.upcase('Mixed-Case')
      assert_equal 'AN M80', Elixir::String.upcase('an M80')
    end

    it 'downcases upper-cased' do
      assert_equal 'DOWNCASED', Elixir::String.upcase('downcased')
    end
  end

  describe 'valid?' do
    it 'returns true when empty' do
      assert Elixir::String.valid? ''
    end

    it 'returns true when valid' do
      assert Elixir::String.valid? 'yup'
      assert Elixir::String.valid? '😁'
      assert Elixir::String.valid? 'José'
      assert Elixir::String.valid? "\n"
    end

    it 'returns false when invalid' do
      refute Elixir::String.valid? "eek\255"
    end
  end

  describe 'valid_character?' do
    it 'returns false when empty' do
      refute Elixir::String.valid_character? ''
    end

    it 'returns true when valid' do
      assert Elixir::String.valid_character? 'y'
      assert Elixir::String.valid_character? '😁'
      assert Elixir::String.valid_character? 'é'
      assert Elixir::String.valid_character? "\n"
    end

    it 'returns false when invalid' do
      refute Elixir::String.valid_character? "\255"
    end
  end
end
