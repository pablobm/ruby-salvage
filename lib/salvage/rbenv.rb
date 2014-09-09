module Salvage
  class Rbenv
    def initialize(rbenv_path = default_rbenv_path)
      @rbenv_path = rbenv_path
    end

    def gem_dirs
      search_glob = File.join(rbenv_path, '*', '**', 'specifications')
      Dir[search_glob].map{|dir| File.dirname(dir) }
    end


    private

    attr_reader :rbenv_path

    def default_rbenv_path
      ENV['RBENV_ROOT'] || File.join(home, '.rbenv')
    end

    def home
      Dir.home(Etc.getpwuid.name)
    end
  end
end
