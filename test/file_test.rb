require 'etc'
require 'test_helper'

describe Elixir::File do
  describe 'cd' do
    it 'returns :ok when already in dir' do
      assert_equal :ok, Elixir::File.cd('.')
    end

    it 'returns :ok when changing to home dir' do
      assert_equal :ok, Elixir::File.cd(Dir.home(Etc.getlogin))
    end

    it 'returns [:error, :enoent] when Errno::ENOENT is raised' do
      assert_equal [:error, :enoent], Elixir::File.cd('$#&@~*$')
    end
  end

  describe 'cd!' do
    it 'returns :ok when already in dir' do
      assert_equal :ok, Elixir::File.cd!('.')
    end

    it 'returns :ok when changing to home dir' do
      assert_equal :ok, Elixir::File.cd!(Dir.home(Etc.getlogin))
    end

    it 'raises an error when invalid' do
      assert_raises(Errno::ENOENT) { Elixir::File.cd!('$#&@~*$') }
    end
  end


end
