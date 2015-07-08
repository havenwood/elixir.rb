module Elixir
  module List
    module_function

    def delete array, item
      array.reject { |x| x == item }
    end

    def delete_at array, index
      array.reject.with_index { |_, i| i == index }
    end

    def duplicate elem, n
      Array.new n, elem
    end

    def first array
      array.first
    end

    def flatten array, tail = []
      array.flatten + tail
    end

    def foldl array, acc, &fun
      array.reduce acc do |accumulator, item|
        fun.call item, accumulator
      end
    end

    def foldr array, acc, &fun
      array.reverse_each.reduce acc do |accumulator, item|
        fun.call item, accumulator
      end
    end

    def insert_at array, index, value
      array.insert index, value
    end

    def keydelete array, key, position
      # TODO
    end

    def keyfind array, key, position, default = nil
      # TODO
    end

    def keymember? array, key, position
      # TODO
    end

    def keyreplace array, key, position, new_array
      # TODO
    end

    def keysort array, position
      # TODO
    end

    def last array
      array.last
    end

    def replace_at array, index, value
      # TODO
    end

    def to_atom char_array
      # TODO
    end

    def to_existing_atom char_array
      # TODO
    end

    def to_float char_array
      # TODO
    end

    def to_integer char_array
      # TODO
    end

    def to_string array
      array.flatten.map do |elem|
        case elem
        when ::Integer
          elem.chr
        when ::String
          elem
        else
          raise ArgumentError
        end
      end.join
    end

    def to_tuple array
      array
    end

    def update_at array, index, &fun
      # TODO
    end

    def wrap obj
      obj.respond_to?(:to_a) ? obj.to_a : [obj]
    end

    def zip array_of_arrays
      array_of_arrays.transpose
    rescue IndexError
      min_size = array_of_arrays.min_by(&:size).size
      array_of_arrays.map { |array| array.first min_size }.transpose
    end
  end
end
