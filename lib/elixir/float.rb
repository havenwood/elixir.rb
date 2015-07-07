module Elixir
  module Float
    module_function

    def ceil number, precision = 0
      # TODO: precision
      number.ceil
    end

    def floor number, precision = 0
      # TODO: precision
      number.floor
    end

    def parse string
      return :error unless string =~ /\A\d/
      string_match = string.match /\A\d+\.?\d*/

      [Float(string_match.to_s), string_match.post_match]
    end

    def round number, precision = 0
      number.round precision
    end

    def to_char_list number, options = nil
      # TODO
    end

    def to_string float, options = nil
      # TODO
    end
  end
end
