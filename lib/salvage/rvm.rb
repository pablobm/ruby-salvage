module Salvage
  class Rvm
    def initialize(rvm_path = default_rvm_path)
      @rvm_path = rvm_path
    end

    def gem_dirs
      search_glob = File.join(gems_base, '*', '**', 'specifications')
      Dir[search_glob].map{|dir| File.dirname(dir) }
    end


    private

    attr_reader :rvm_path

    def gems_base
      File.join(rvm_path, 'gems')
    end

    def default_rvm_path
      ENV['rvm_path'] || File.join(home, '.rvm')
    end

    def home
      Dir.home(Etc.getpwuid.name)
    end
  end
end
