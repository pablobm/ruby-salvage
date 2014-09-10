module Salvage
  class Utils

    def self.home_dir(relpath)
      File.join(Dir.home(Etc.getpwuid.name), relpath)
    end

    def self.envvar_to_array(value)
      paths = value.to_s =~ %r{^\((.*)\)$} ? $~[1] : ''
      paths.split(' ')
    end

  end
end
