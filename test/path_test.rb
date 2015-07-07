require 'test_helper'

describe Elixir::Path do
  describe 'absname' do
    it 'expands to the absolute path' do
      assert Elixir::Path.absname('').start_with? '/'
    end
  end

  describe 'basename' do
    it 'returns empty when root' do
      assert_equal '', Elixir::Path.basename('/')
    end

    it 'returns a basename' do
      refute_includes Elixir::Path.basename('.'), '/'
    end
  end

  describe 'dirname' do
    it 'returns the dirname' do
      assert_equal '.', Elixir::Path.dirname('.')
      assert_equal '/', Elixir::Path.dirname('/')
      assert_equal '/ex/dir', Elixir::Path.dirname('/ex/dir/file.ex')
    end
  end

  describe 'expand' do
    it 'returns and absolute, expanded path' do
      assert Elixir::Path.expand('.').start_with? '/'
      assert_equal '/', Elixir::Path.expand('/')
      assert_equal '/ex/dir/file.ex', Elixir::Path.expand('/ex/dir/file.ex')
    end
  end

  describe 'extname' do
    it 'returns the extname' do
      assert_equal '.rb', Elixir::Path.extname('file.rb')
      assert_equal '.ex', Elixir::Path.extname('file.ex')
    end
  end


end
