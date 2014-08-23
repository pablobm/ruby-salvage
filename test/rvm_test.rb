require 'test_helper'
require 'salvage/rvm'

describe Salvage::Rvm do

  describe "#gem_dirs" do
    it "lists the gem paths for all installed rubies" do
      base_path = fixture_path('rvm')
      rvm = Salvage::Rvm.new(base_path)

      actual = rvm.gem_dirs.sort
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
  end

end
