require 'test_helper'
require 'salvage/gem_finder'

describe Salvage::GemFinder do

  describe "#gem_dirs" do
    it "lists RVM gems" do
      base_path = fixture_path('rvm')
      finder = Salvage::GemFinder.new(base_path)
      actual = finder.gem_dirs.sort
      expected = [
        'ruby-1.9.3-p545',
        'ruby-2.1.2',
        'ruby-2.0.0-p353',
        'ruby-2.1.1@global',
        'ruby-1.9.3-p545@global',
        'ruby-2.0.0-p353@global',
        'ruby-2.1.1',
        'ruby-2.1.2@global',
      ].map{|dir| File.join(base_path, 'gems', dir) }.sort

      assert_equal expected, actual
    end

    it "lists rbenv gems" do
      base_path = fixture_path('rbenv')
      finder = Salvage::GemFinder.new(base_path)
      actual = finder.gem_dirs.sort
      expected = [
        '1.9.3-p547/lib/ruby/gems/1.9.1',
        '2.1.2/lib/ruby/gems/2.1.0',
      ].map{|dir| File.join(base_path, 'versions', dir) }.sort

      assert_equal expected, actual
    end
  end

end
