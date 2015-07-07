module Elixir
  module Range
    module_function

    def new first, last
      first..last
    end

    def range? range
      range.instance_of? ::Range
    end
  end
end
