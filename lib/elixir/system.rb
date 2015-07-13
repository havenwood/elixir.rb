require 'date'
require 'etc'

module Elixir
  module System
    module_function

    def argv
      ARGV
    end

    def argv= new_argv
      Object.const_set :ARGV, new_argv
    end

    def at_exit fun
      at_exit &fun
    end

    def build_info
      version = RUBY_VERSION
      date = Date.parse(RUBY_RELEASE_DATE).rfc2822

      {version: version, date: date}.inspect
    end

    def cmd command, args, opts = []
      # TODO
      raise NotImplementedError
    end

    def cwd
      Dir.pwd rescue nil
    end

    def cwd!
      Dir.pwd
    end

    def delete_env varname
      ENV.delete varname
    end

    def find_executable program
      # TODO
      raise NotImplementedError
    end

    def get_env varname
      ENV[varname]
    end

    def get_pid
      Process.pid.to_s
    end

    def halt status = 0
      exit status
    end

    def put_env varname, value
      ENV[varname] = value
    end

    def put_envs hash
      hash.each { |varname, value| ENV[varname] = value }
    end

    def stacktrace
      caller_locations
    end

    def tmp_dir
      Dir.tmpdir rescue nil
    end

    def tmp_dir!
      Dir.tmpdir
    end

    def user_home
      Dir.home(Etc.getlogin) rescue nil
    end

    def user_home!
      Dir.home Etc.getlogin
    end

    def version
      RUBY_VERSION
    end
  end
end
