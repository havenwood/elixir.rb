# Elixir.rb

[![Build Status](https://travis-ci.org/havenwood/elixir.rb.svg?branch=v0.1.0)](https://travis-ci.org/havenwood/elixir.rb)

The [Elixir](http://elixir-lang.org) standard library in [Ruby](https://www.ruby-lang.org)!

So far there are partial implementations of the following Elixir modules:

* Agent
* Atom
* Base
* Dict
* Enum
* File
* Float
* Integer
* List
* OptionParser
* Path
* Range
* Set
* Stream
* String
* System
* Task
* Tuple
* Version

## Installation

```bash
gem install elixir.rb
```

## Examples

[Stream.unfold/2](http://elixir-lang.org/docs/stable/elixir/Stream.html#unfold/2)

```ruby
require 'elixir/stream'

include Elixir

Fib = Stream.unfold [0, 1] do |a, b|
  [a, [b, a + b]]
end

Fib.size
#=> Infinity

Fib.take 5
#=> [0, 1, 1, 2, 3]
```

[Agent](http://elixir-lang.org/docs/stable/elixir/Agent.html) and [Task](http://elixir-lang.org/docs/stable/elixir/Task.html)

```ruby
require 'elixir/agent'
require 'elixir/task'

include Elixir

status, agent = Agent.start { 0 }
#=> [:ok, #<Concurrent::Atomic:...>]

Agent.cast(agent) { |value| value + 42 }
#=> :ok

Agent.get(agent, &:next)
#=> 43

task = Task.async ->{ sleep 0.5; Agent.get(agent, &:itself) }
#<Concurrent::IVar:...>

Task.await(task)
#=> 42
```

## Requirements

Ruby 2.2+

## Development

Install Elixir.rb and its deps:
```bash
git clone https://github.com/havenwood/elixir.rb
cd elixir.rb
gem install -g --no-lock
```

Run the tests:
```bash
RUBYGEMS_GEMDEPS="-" rake
```
