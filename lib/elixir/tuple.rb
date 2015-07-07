module Elixir
  module Tuple
    module_function

    def delete_at array, index
      array.delete_at index

      array
    end

    def duplicate data, size
      Array.new size, data
    end

    def insert_at array, index, value
      array.insert index, value
    end

    def to_list array
      array.to_a
    end
  end
end
