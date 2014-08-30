require 'rubygems/server'
require 'salvage/rvm'

module Salvage
  class Server

    def initialize(port)
      @server = Gem::Server.new rvm.gem_dirs, port, false
    end

    def run
      server.run
    end


    private

    attr_accessor :server

    def rvm
      @rvm ||= Salvage::Rvm.new
    end

  end
end
