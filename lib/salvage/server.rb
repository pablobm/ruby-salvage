require 'rubygems/server'
require 'salvage/rvm'
require 'salvage/rbenv'
require 'salvage/ruby_install'

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
      rvm.gem_dirs + rbenv.gem_dirs + ruby_install.gem_dirs
    end

    def rvm
      @rvm ||= Salvage::Rvm.new
    end

    def rbenv
      @rbenv ||= Salvage::Rbenv.new
    end

    def ruby_install
      @ruby_install ||= Salvage::RubyInstall.new
    end

  end
end
