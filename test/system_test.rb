require 'test_helper'

describe Elixir::System do
  describe 'argv' do
    it 'returns ARGV' do
      assert_kind_of Array, Elixir::System.argv
    end
  end

  describe 'argv=' do
    it 'replaces ARGV' do
      $stderr = StringIO.new
      Elixir::System.argv = []
      $stderr = STDERR

      assert_equal [], Elixir::System.argv
    end
  end

  describe 'at_exit' do
    it 'schedules a function to be run at exit'
  end

  describe 'build_info' do
    it 'returns a Hash with :version and :date' do
      assert_equal [:version, :date], eval(Elixir::System.build_info).keys
    end
  end

  describe 'cmd' do
    it ''
  end

  describe 'cwd' do
    it 'returns the current working directory or nil on error' do
      assert Elixir::System.cwd.start_with? '/'
    end
  end

  describe 'cwd!' do
    it 'returns the current working directory' do
      assert Elixir::System.cwd.start_with? '/'
    end
  end

  describe 'delete_env' do
    it 'deletes the env var'
  end

  describe 'find_executable' do
    it ''
  end

  describe 'get_env' do
    it 'gets the env var'
  end

  describe 'get_pid' do
    it 'returns the current process id' do
      assert_match /\d+/, Elixir::System.get_pid
    end
  end

  describe 'halt' do
    it 'exits'
  end

  describe 'put_env' do
    it 'sets an env var'
  end

  describe 'put_envs' do
    it 'sets multiple env vars'
  end
    
  describe 'stacktrace' do
    it 'returns a stacktrace' do
      assert_kind_of Array, Elixir::System.stacktrace
    end
  end

  describe 'tmp_dir' do
    it ''
  end

  describe 'tmp_dir!' do
    it ''
  end

  describe 'user_home' do
    it ''
  end

  describe 'user_home!' do
    it ''
  end

  describe 'version' do
    it 'has a version' do
      refute_nil Elixir::System.version
    end
  end
end
