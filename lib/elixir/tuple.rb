module Elixir
  module Tuple
    module_function

    def delete_at array, index
      array.reject.with_index { |_, i| i == index }
    end

    def duplicate data, size
      Array.new size, data
    end

    def insert_at array, index, value
      if index.zero?
        [value] + array
      elsif index == array.size
        array + [value]
      else
        array[0..index - 1] + [value] + array[index..-1]
      end
    end

    def to_list array
      array.to_a
    end
  end
end
