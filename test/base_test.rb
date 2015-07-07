require 'test_helper'

describe Elixir::Base do
  describe 'decode16' do
    it 'returns empty when empty' do
      assert_equal [:ok, ''], Elixir::Base.decode16('')
    end
  
    it 'decodes base16' do
      assert_equal [:ok, 'foobar'], Elixir::Base.decode16('666F6F626172')
    end
  end
  
  describe 'decode16!' do
    it 'returns empty when empty' do
      assert_empty Elixir::Base.decode16!('')
    end
  
    it 'decodes base16' do
      assert_equal 'foobar', Elixir::Base.decode16!('666F6F626172')
    end
  end

  describe 'decode32' do
    it 'returns empty when empty' do
      assert_equal [:ok, ''], Elixir::Base.decode32('')
    end
  
    it 'decodes base32' do
      assert_equal [:ok, 'foobar'], Elixir::Base.decode32('MZXW6YTBOI======')
    end
  end
  
  describe 'decode32!' do
    it 'returns empty when empty' do
      assert_empty Elixir::Base.decode32!('')
    end
  
    it 'decodes base32' do
      assert_equal 'foobar', Elixir::Base.decode32!('MZXW6YTBOI======')
    end
  end

  describe 'decode64' do
    it 'returns empty when empty' do
      assert_equal [:ok, ''], Elixir::Base.decode64('')
    end
  
    it 'decodes base64' do
      assert_equal [:ok, 'foobar'], Elixir::Base.decode64('Zm9vYmFy')
    end
  end
  
  describe 'decode64!' do
    it 'returns empty when empty' do
      assert_empty Elixir::Base.decode64!('')
    end
  
    it 'decodes base64' do
      assert_equal 'foobar', Elixir::Base.decode64!('Zm9vYmFy')
    end
  end

  describe 'encode16' do
    it 'encodes base16' do
      assert_equal '666F6F626172', Elixir::Base.encode16('foobar') 
    end
  end

  describe 'encode32' do
    it 'encodes base32' do
      assert_equal 'MZXW6YTBOI======', Elixir::Base.encode32('foobar')
    end
  end

  describe 'encode64' do
    it 'encodes base64' do
      assert_equal 'Zm9vYmFy', Elixir::Base.encode64('foobar')
    end
  end

  describe 'hex_encode32' do
    it 'hex-encodes base32' do
      skip
      assert_equal 'CPNMUOJ1E8======', Elixir::Base.hex_encode32('foobar')
    end
  end


end
