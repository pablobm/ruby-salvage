module Salvage
  class Utils

    def self.home_dir(relpath)
      File.join(Dir.home(Etc.getpwuid.name), relpath)
    end

  end
end
