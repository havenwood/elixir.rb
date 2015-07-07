require 'base32'
require 'base64'

module Elixir
  module Base
    UPPERCASE = /[[:upper:]]/.freeze
    LOWERCASE = /[[:lower:]]/.freeze
    
    module_function

    def decode16 string, char_case: :upper
      case char_case
      when :upper
        return :error if string =~ LOWERCASE
      when :lower
        return :error if string =~ UPPERCASE
      end

      [:ok, [string].pack('H*')] rescue :error
    end

    def decode16! string, char_case: :upper
      case char_case
      when :upper
        raise ArgumentError if string =~ LOWERCASE
      when :lower
        raise ArgumentError if string =~ UPPERCASE
      end

      [string].pack 'H*'
    end

    def decode32 string, char_case: :upper
      case char_case
      when :upper
        return :error if string =~ LOWERCASE
      when :lower
        return :error if string =~ UPPERCASE
      end

      [:ok, Base32.decode(string)] rescue :error
    end

    def decode32! string, char_case: :upper
      case char_case
      when :upper
        raise ArgumentError if string =~ LOWERCASE
      when :lower
        raise ArgumentError if string =~ UPPERCASE
      end

      Base32.decode string
    end

    def decode64 string
      [:ok, Base64.strict_decode64(string)] rescue :error
    end

    def decode64! string
      Base64.strict_decode64 string
    end

    def encode16 data, char_case: :upper
      encoded = data.unpack('H*').first

      char_case == :upper ? encoded.upcase : encoded
    end

    def encode32 data, char_case: :upper
      encoded = Base32.encode data

      char_case == :upper ? encoded.upcase : encoded
    end

    def encode64 data
      Base64.strict_encode64(data)
    end

    def hex_encode32 string, char_case: :upper
      # TODO
    end

    def hex_decode32 string, char_case: :upper
      # TODO
    end

    def hex_decode32! string, char_case: :upper
      # TODO
    end

    def url_decode64 string
      # TODO
    end

    def url_decode64! string
      # TODO
    end
  end
end
