require 'test_helper'
require 'salvage/rvm'

describe Salvage::GemFinder do

  describe "#gem_dirs" do
    it "lists possible gem paths under the given path" do
      base_path = fixture_path
      finder = Salvage::GemFinder.new(base_path)

      expected_rvm = [
        'ruby-1.9.3-p545',
        'ruby-2.1.2',
        'ruby-2.0.0-p353',
        'ruby-2.1.1@global',
        'ruby-1.9.3-p545@global',
        'ruby-2.0.0-p353@global',
        'ruby-2.1.1',
        'ruby-2.1.2@global',
      ].map{|dir| File.join(base_path, 'rvm', 'gems', dir) }

      expected_rbenv = [
        '1.9.3-p547/lib/ruby/gems/1.9.1',
        '2.1.2/lib/ruby/gems/2.1.0',
      ].map{|dir| File.join(base_path, 'rbenv', 'versions', dir) }

      expected = (expected_rvm + expected_rbenv).sort
      actual = finder.gem_dirs.sort

      assert_equal expected, actual
    end
  end

end
