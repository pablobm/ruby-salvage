require 'salvage/gem_finder'
require 'salvage/utils'

module Salvage
  class Rbenv

    def initialize(rbenv_path = default_rbenv_path)
      @finder = Salvage::GemFinder.new(rbenv_path)
    end

    def gem_dirs
      @finder.gem_dirs
    end


  private

    def default_rbenv_path
      ENV['RBENV_ROOT'] || Salvage::Utils.home_dir('.rbenv')
    end

  end
end
