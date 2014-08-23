require 'rubygems'
require 'rubygems/server'
require 'salvage/rvm'
require 'pp'

rvm = Salvage::Rvm.new

server = Gem::Server.new rvm.gem_dirs, 8089, false

pp Gem::Specification.all.map{|s| [s.name, s.version] }
pp Gem::Specification.dirs

server.run
