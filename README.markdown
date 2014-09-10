# Salvage

Run a Rubygems server that provides gems installed in any RVM/rbenv/etc environment in the machine.

## Wut?

  1. You work in a number of projects, each using different gems in different versions of Ruby.
  2. One day you are on an airplane (or similarly Internet-less environment) and you need a gem that you know is installed in your machine, but for a different version of Ruby, or in a separate gemset.
  3. You could go find it and install it manually, but there might be dependencies to resolve.

Salvage runs a Gem server that makes available any gems installed anywhere in your machine, across all your RVM/rbenv/etc environments.

## How to use

Install the gem:

    $ gem install salvage

List available gems:

    $ salvage.rb list
    POpen4 (0.1.4)
    XMLCanonicalizer (1.0.1)
    ZenTest (4.9.5)
    abstract (1.0.0)
    abstract_type (0.0.6)
    action_mailer_cache_delivery (0.3.5)
    actionmailer (4.1.1, 4.1.0, 4.0.5, 3.0.10, 3.0.4, 2.3.3)
    ...
    yamler (0.1.0)
    yard (0.8.7.3, 0.8.6.1, 0.8.0, 0.7.5, 0.7.4, 0.7.3)
    yui-compressor (0.9.6)
    zip (2.0.2)

Run a server that makes all these available:

    $ salvage.rb
    Server started at http://0.0.0.0:8089
    Server started at http://[::]:8089

Install gems manually:

    $ gem install some-gem --source http://0.0.0.0:8089

Or you can change the `source` line on your project's `Gemfile` to point (temporarily) to this server:

    # source 'https://rubygems.org'
    source 'http://0.0.0.0:8089'

And of course run Bundler straightaway:

    $ bundle install

# How does this work internally?

It's actually very simple, as RubyGems does all the heavy lifting for you. The following is a cleaned up version of the first, proof-of-concept commit of this project:

    require 'rubygems'
    require 'rubygems/server'

    RVM_PATH = ENV['rvm_path']
    GEMS_BASE = File.join(RVM_PATH, 'gems')

    search_glob = File.join(GEMS_BASE, '*', '**', 'specifications')
    spec_dirs = Dir[search_glob].map{|dir| File.dirname(dir) }

    server = Gem::Server.new(spec_dirs, 8089, false)
    server.run

The rest is only adding for managers other than RVM, and putting it together in a nice gem.

## Known issues

In some cases, Salvage doesn't work well if you run it from a directory that contains a Gemfile. "Why?" I hear you ask. Well, I'm glad that you are asking this question my friend...

I have no clue. And I don't really care that much, but if you'd enlighten me, I'd be grateful.

Anyway, if this happens to you, just `cd ..` out of that directory before running the server.
