require 'test_helper'
require 'salvage/rbenv'

describe Salvage::Rbenv do

  describe "#gem_dirs" do
    it "lists the gem paths of all installed rubies" do
      base_path = fixture_path('rbenv')
      rbenv = Salvage::Rbenv.new(base_path)

      actual = rbenv.gem_dirs.sort
      expected = [
        '1.9.3-p547/lib/ruby/gems/1.9.1',
        '2.1.2/lib/ruby/gems/2.1.0',
      ].map{|dir| File.join(base_path, 'versions', dir) }.sort

      assert_equal expected, actual
    end
  end

end
