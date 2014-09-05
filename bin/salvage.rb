#!/usr/bin/env ruby

require 'salvage/server'

command = ARGV.first

def server_command
  server = Salvage::Server.new(8089)
  server.run
end

def list_command
  Salvage::Server.new(8089)

  gem_versions = Hash.new{|h, k| h[k] = [] }
  Gem::Specification.each do |gem|
    gem_versions[gem.name] << gem.version
  end

  gem_versions.sort_by{|name, _| name }.each do |(name, versions)|
    version_strs = versions.sort.reverse.join(', ')
    puts "#{name} (#{version_strs})"
  end
end


case command
when 'server', nil
  server_command
when 'list'
  list_command
else
  puts "Unknown command #{command.inspect}. Valid commands are: server, list."
end
