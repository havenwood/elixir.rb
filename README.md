# Elixir.rb

The Elixir standard library implemented in Ruby. This is currently just a code spike that implements parts of Enum and Stream.

## Installation

```bash
gem install elixir.rb
```

## Usage

```ruby
require 'elixir/stream'

include Elixir

Fib = Stream.unfold [0, 1] do |a, b|
  [a, [b, a + b]]
end

Fib.take 5
#=> [0, 1, 1, 2, 3]
```

```ruby
require 'elixir/enum'

include Elixir

Enum.filter [1, 2, 3], &:odd?
#=> [1, 3]
```

## Development

Install Elixir.rb and its deps:
```bash
git clone https://github.com/havenwood/elixir.rb
cd elixir.rb
gem install -g --no-lock
```

Run the tests:
```bash
rake
```
