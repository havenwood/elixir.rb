module Elixir
  module String
    module_function

    def at string, index
      string[index]
    end

    def capitalize string
      string.capitalize
    end

    def chunk string, trait
      # TODO
    end

    def codepoints string
      string.chars
    end

    def contains? string, contents
      warn '[deprecation] Calling String.contains?/2 with an empty string is deprecated and will fail in the future' if contents.empty?

      string.include? contents
    end

    def downcase string
      string.downcase
    end

    def duplicate string, n
      string * n
    end

    def ends_with? string, *suffixes
      warn '[deprecation] Calling String.ends_with?/2 with an empty string is deprecated and will fail in the future' if string.empty?

      string.end_with? *suffixes.flatten(1)
    end

    def first string
      string[0]
    end

    def graphemes string
      string.chars
    end

    def last string
      string[-1]
    end

    def length string
      string.size
    end

    def ljust string, length, padding = ' '
      string.ljust length, padding
    end

    def lstrip string, char = :todo
      string.lstrip
    end

    def match? string, regex
      # TODO
    end

    def next_codepoint string
      [string[0], string[1..-1]]
    end

    def next_grapheme string
      [string[0], string[1..-1]]
    end

    def printable? string
      # TODO
    end

    def replace string, pattern, replacement, options = []
      # TODO
    end

    def reverse string
      string.reverse
    end

    def rjust string, len, padding
      # TODO
    end

    def rstrip string, char = ' '
      # TODO
    end

    def slice string, range
      # TODO
    end

    def split string
      string.split
    end

    def split_at string, offset
      # TODO
    end

    def starts_with string, prefix
      string.start_with? prefix
    end

    def strip string, char = nil
      # TODO
    end

    def to_atom string
      string.to_sym
    end

    def to_char_list string
      string.chars
    end

    def to_existing_atom string
      # Nothing to see here... >.>
      if Symbol.all_symbols.map(&:to_s).include? string
        string.to_sym
      else
        raise ArgumentError
      end
    end

    def to_float string
      Float(string)
    end

    def to_integer string, base = 10
      Integer(string)
    end

    def upcase string
      string.upcase
    end

    def valid? string
      string.valid_encoding?
    end

    def valid_character? char
      char.size == 1 && char.valid_encoding?
    end
  end
end
