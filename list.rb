require 'salvage/server'

Salvage::Server.new(8089)

gem_versions = Hash.new{|h, k| h[k] = [] }
gems = Gem::Specification.all
gems.each do |gem|
  gem_versions[gem.name] << gem.version
end

gem_versions.sort_by{|name, _| name }.each do |(name, versions)|
  version_strs = versions.sort.reverse.join(', ')
  puts "#{name} (#{version_strs})"
end
