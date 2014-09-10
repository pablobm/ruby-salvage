require 'salvage/gem_finder'
require 'salvage/utils'

module Salvage
  class RubyInstall

    def initialize(rubies_paths = default_rubies_paths)
      @finders = rubies_paths.map{|path| Salvage::GemFinder.new(path) }
    end

    def gem_dirs
      @finders.map{|f| f.gem_dirs }.flatten
    end

  private

    def default_rubies_paths
      Salvage::Utils.envvar_to_array(ENV['RUBIES']) + [
        Salvage::Utils.home_dir('.rubies'),
        Salvage::Utils.home_dir('.gem'),
        '/opt',
      ]
    end

  end
end
