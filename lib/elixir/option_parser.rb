require 'shellwords'

module Elixir
  module OptionParser
    module_function

    def next argv, switches = []
      # TODO: switches
      argv = argv.dup

      option = argv.shift
      return [:error, argv] unless option

      if option.start_with? '-'
        key = option.sub(/\-{,2}/, '').gsub(/\-/, '_').to_sym

        if argv.empty? || argv.first.start_with?('-')
          value = true
        else
          value = argv.shift
        end

        [:ok, key, value, argv]
      else
        [:error, argv.unshift(option)]
      end
    end

    def parse argv, switches = []
      # TODO: switches
      parsed = {}
      argv = argv.dup
      extras = []
      errors = {}
      
      loop do
        option_tuple = self.next argv

        case option_tuple.first
        when :ok
          _, key, value, argv = option_tuple
      
          parsed[key] = value
        when :error
          _, string = option_tuple
          argv.shift
          extra = string.shift

          extras << extra if extra
        end

        break [parsed, extras, errors] if option_tuple.last.empty?
      end
    end

    def parse_head argv, switches = []
      # TODO: switches
      parsed = {}
      argv = argv.dup
      errors = {}

      loop do
        option_tuple = self.next argv

        case option_tuple.first
        when :ok
          _, key, value, argv = option_tuple

          parsed[key] = value
        when :error
          _, argv = option_tuple

          break [parsed, argv, errors]
        end
      end
    end

    def split string
      Shellwords.shellsplit string
    end

    def to_argv enum
      enum.flat_map do |k, v|
        return unless v

        v == true ? "--#{k}" : ["--#{k}", v]
      end.compact
    end
  end
end
