module Elixir
  module Set
    module_function

    def delete set, value
      ::Set.new set.reject { |x| x == value }
    end

    def difference set1, set2
      set1.difference set2
    end

    def disjoint? set1, set2
      set1.disjoint? set2
    end

    def equal? set1, set2
      set1 === set2
    end

    def intersection set1, set2
      set1.intersection set2
    end

    def member? set, value
      set.member? value
    end

    def put set, value
      ::Set.new set.to_a.concat([value])
    end

    def size set
      set.size
    end

    def subset? set1, set2
      set1.subset? set2
    end

    def to_list set
      set.to_a
    end

    def union set1, set2
      set1.union set2
    end
  end
end
