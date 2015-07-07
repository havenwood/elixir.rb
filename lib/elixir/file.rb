module Elixir
  module File
    module_function

    def cd path
      :ok if Dir.chdir(path).zero?
    rescue Errno::ENOENT
      [:error, :enoent]
    end

    def cd! path
      :ok if Dir.chdir(path).zero?
    end 

    # TODO: All the other File module functions.
  end
end
