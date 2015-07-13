module Elixir
  module Enum
    module_function

    def all? collection, &block
      collection.all? &block
    end

    def any? collection, &block
      collection.any? &block
    end

    def at collection, index, default = nil
      collection[index] || default
    end

    def chunk collection, n, step: nil, pad: nil
      # TODO
      raise NotImplementedError
    end

    def chunk_by collection, &block
      collection.chunk(&block).map(&:last).to_a
    end

    def concat *collections
      collections.inject :concat
    end

    def count collection, &block
      collection.count &block
    end

    def drop collection, count
      collection.drop count
    end

    def drop_while collection, &block
      collection.drop_while &block
    end

    def each collection, &block
      collection.each &block

      :ok
    end

    def empty? collection
      collection.empty?
    end

    def fetch collection, n
      # TODO
      raise NotImplementedError
    end

    def fetch! collection, n
      # TODO
      raise NotImplementedError
    end

    def filter collection, &block
      collection.select &block
    end

    def filter_map collection, filter, mapper
      # TODO
      raise NotImplementedError
    end

    def find collection, ifnone = nil, &block
      collection.find ifnone, &block
    end

    def find_index collection, &block
      # TODO
      raise NotImplementedError
    end

    def find_value collection, ifnone = nil, &block
      # TODO
      raise NotImplementedError
    end

    def flat_map collection, &block
      collection.flat_map &block
    end

    def flat_map_reduce collection, acc, &block
      # TODO
      raise NotImplementedError
    end

    def group_by collection, &block
      collection.group_by(&block).map { |k, v| [k.to_s.to_sym, v] }.to_h
    end

    def intersperse collection, element
      collection.each_with_object(element).to_a.flatten 1
    end

    def into collection, list, transform = nil
      # TODO
      raise NotImplementedError
    end

    def join collection, joiner = ''
      collection.join joiner
    end

    def map collection, &block
      collection.map &block
    end

    def map_join collection, joiner = '', &block
      collection.map(&block).join joiner
    end

    def map_reduce collection, acc, &block
      # TODO
      raise NotImplementedError
    end

    def max collection
      collection.max or raise 'empty error'
    end

    def max_by collection, &block
      collection.max_by &block
    end

    def member? collection, value
      collection.member? value
    end

    def min collection
      collection.min or raise 'empty error'
    end

    def min_by collection, &block
      collection.min_by &block
    end

    def partition collection, &block
      collection.partition &block
    end

    def reduce collection, acc = nil, &block
      collection.reduce acc, &block
    end

    def reject collection, &block
      collection.reject &block
    end

    def reverse collection, tail = nil
      if tail
        collection.reverse << tail
      else
        collection.reverse
      end
    end

    def scan collection, acc = 0, &block
      # TODO
      raise NotImplementedError
    end

    def shuffle collection
      collection.shuffle
    end

    def slice collection, x, count = nil
      # TODO
      raise NotImplementedError
    end

    def sort collection, &block
      collection.sort &block
    end

    def sort_by collection, mapper, sorter = nil
      # TODO
      raise NotImplementedError
    end

    def split collection, count
      # TODO
      raise NotImplementedError
    end

    def split_while collection, &block
      # TODO
      raise NotImplementedError
    end

    def sum collection
      collection.inject :+
    end

    def take collection, count
      collection.take count
    end

    def take_every collection, nth
      collection.each_slice(nth).map &:first
    end

    def take_while collection, &block
      # TODO
      raise NotImplementedError
    end

    def to_list collection
      collection.to_a
    end

    def uniq collection, &block
      collection.uniq &block
    end

    def with_index collection
      collection.each_with_index.to_a
    end

    def zip collection1, collection2
      collection1.zip collection2
    end
  end
end
