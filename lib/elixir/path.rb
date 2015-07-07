module Elixir
  module Path
    module_function

    def absname path
      ::File.expand_path path
    end

    def basename path
      base = ::File.basename path

      base == '/' ? '' : base
    end

    def dirname path
      ::File.dirname path
    end

    def expand path
      ::File.expand_path path
    end

    def extname path
      ::File.extname path
    end

    # TODO: The other Path module functions.
  end
end
