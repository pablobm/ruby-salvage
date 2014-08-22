require 'pp'
require 'set'
require 'rubygems'
require 'rubygems/server'

RVM_PATH = ENV['rvm_path']
GEMS_BASE = File.join(RVM_PATH, 'gems')

search_glob = File.join(GEMS_BASE, '*', '**', 'specifications')
spec_dirs = Dir[search_glob].map{|dir| File.dirname(dir) }

server = Gem::Server.new spec_dirs, 8089, false

pp Gem::Specification.all.map{|s| [s.name, s.version] }
pp Gem::Specification.dirs

server.run
