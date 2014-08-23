require 'minitest/autorun'
require 'minitest/spec'

def fixture_path(relpath)
  here = File.dirname(__FILE__)
  File.join(here, 'fixtures', relpath)
end
