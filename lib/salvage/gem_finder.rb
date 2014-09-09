module Salvage
  class GemFinder

    def initialize(base_path)
      @base_path = base_path
    end

    def gem_dirs
      search_glob = File.join(base_path, '*', '**', 'specifications')
      Dir[search_glob].map{|dir| File.dirname(dir) }
    end


  private

    attr_reader :base_path

  end
end
