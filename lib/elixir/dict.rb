module Elixir
  module Dict
    module_function

    def delete list, key
      list.delete key

      list
    end

    def drop list, keys
      keys.each do |key|
        list.delete key
      end

      list
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
    end
    
    def hash_key? dict, key
      # TODO
    end
    
    def keys dict
      # TODO
    end
    
    def merge dict1, dict2, fun = -> _k, _v1, v2 { v2 }
      # TODO
    end
    
    def pop dict, key, default = nil
      # TODO
    end
    
    def put dict, key, val
      # TODO
    end
    
    def put_new dict, key, val
      # TODO
    end
    
    def size dict
      # TODO
    end
    
    def split dict, keys
      # TODO
    end
    
    def take dict, keys
      # TODO
    end
    
    def to_list dict
      # TODO
    end
    
    def update dict, key, initial, fun
      # TODO
    end
    
    def update! dict, key, fun
      # TODO
    end
    
    def values dict
      # TODO
    end
  end
end
