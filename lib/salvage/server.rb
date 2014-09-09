require 'rubygems/server'
require 'salvage/rvm'
require 'salvage/rbenv'

module Salvage
  class Server

    def initialize(port)
      @server = Gem::Server.new(gem_dirs, port, false)
    end

    def run
      server.run
    end


    private

    attr_accessor :server

    def gem_dirs
      rvm.gem_dirs + rbenv.gem_dirs
    end

    def rvm
      @rvm ||= Salvage::Rvm.new
    end

    def rbenv
      @rbenv ||= Salvage::Rbenv.new
    end

  end
end
