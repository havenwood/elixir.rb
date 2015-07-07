module Elixir
  VERSION = '0.1.0'

  module Version
    module_function

    def compare version1, version2
      case Gem::Version.new(version1) <=> Gem::Version.new(version2)
      when 1
        :gt
      when 0
        :eq
      when -1
        :lt
      end
    end

    def match? version, requirement
      Gem::Dependency.new('', requirement).match? '', version
    end

    def parse version
      [:ok, Gem::Version.new(version)]
    rescue
      :error
    end

    def parse_requirements string
      [:ok, Gem::Requirement.new(string)]
    rescue
      :error
    end
  end
end
