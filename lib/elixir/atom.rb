module Elixir
  module Atom
    module_function

    def to_char_list symbol
      symbol.to_s.chars
    end

    def to_string symbol
      symbol.to_s
    end
  end
end
