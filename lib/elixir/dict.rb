module Elixir
  module Dict
    module_function

    def delete list, key
      list.reject { |k| k == key }
    end

    def drop list, keys
      list.reject { |k| keys.include?(k) }
    end

    def equal? dict1, dict2
      dict1.eql? dict2
    end

    def fetch dict, key
      dict.fetch(key) rescue nil
    end

    def fetch!
      dict.fetch key
    end

    def get dict, key, default = nil
      # TODO
      raise NotImplementedError
    end

    def hash_key? dict, key
      # TODO
      raise NotImplementedError
    end

    def keys dict
      # TODO
      raise NotImplementedError
    end

    def merge dict1, dict2, fun = -> _k, _v1, v2 { v2 }
      # TODO
      raise NotImplementedError
    end

    def pop dict, key, default = nil
      # TODO
      raise NotImplementedError
    end

    def put dict, key, val
      # TODO
      raise NotImplementedError
    end

    def put_new dict, key, val
      # TODO
      raise NotImplementedError
    end

    def size dict
      # TODO
      raise NotImplementedError
    end

    def split dict, keys
      # TODO
      raise NotImplementedError
    end

    def take dict, keys
      # TODO
      raise NotImplementedError
    end

    def to_list dict
      # TODO
      raise NotImplementedError
    end

    def update dict, key, initial, fun
      # TODO
      raise NotImplementedError
    end

    def update! dict, key, fun
      # TODO
      raise NotImplementedError
    end

    def values dict
      # TODO
      raise NotImplementedError
    end
  end
end
