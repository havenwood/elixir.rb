module Elixir
  module Integer
    module_function

    def is_even integer
      integer.even?
    end

    def is_odd integer
      integer.odd?
    end

    def parse string
      return :error unless string =~ /\A[\-\+]?\d/

      if remainder_index = string[1..-1] =~ /\D/
        [Integer(string[0..remainder_index]), string[remainder_index.next..-1]]
      else
        [Integer(string), '']
      end
    end

    def to_char_list integer, base = 10
      integer.to_s(base).upcase.chars
    end

    def to_string integer, base = 10
      integer.to_s(base).upcase
    end
  end
end
