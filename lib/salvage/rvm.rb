require 'salvage/gem_finder'
require 'salvage/utils'

module Salvage
  class Rvm

    def initialize(rvm_path = default_rvm_path)
      @rvm_path = rvm_path
      @finder = Salvage::GemFinder.new(gems_base)
    end

    def gem_dirs
      @finder.gem_dirs
    end


  private

    attr_reader :rvm_path

    def gems_base
      File.join(rvm_path, 'gems')
    end

    def default_rvm_path
      ENV['rvm_path'] || Salvage::Utils.home_dir('.rvm')
    end

  end
end
