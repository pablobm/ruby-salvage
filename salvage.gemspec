require_relative 'lib/salvage/version'

Gem::Specification.new do |s|
  s.name = "salvage"
  s.version = Salvage::Version::STRING
  s.summary = "Make available any gems installed in any of your Ruby environments"
  s.description = "Run a Rubygems server that provides gems installed in any RVM/rbenv/etc environment in the machine"
  s.license = 'MIT'

  s.author = "Pablo Brasero"
  s.email = "pablo@pablobm.com"
  s.homepage = 'https://rubygems.org/gems/salvage'

  s.files = Dir['lib/**/*.rb', 'bin/*']
  s.executables << 'salvage.rb'

  s.add_development_dependency 'rake'
end
