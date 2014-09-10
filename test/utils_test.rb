require 'salvage/utils'

describe Salvage::Utils do

  describe "#envvar_to_array" do
    it "reads array-like envvar values" do
      value = "(/opt/jruby-1.7.0 /Users/pablobm/src/rubinius)"

      actual = Salvage::Utils.envvar_to_array(value)
      expected = [
        '/opt/jruby-1.7.0',
        '/Users/pablobm/src/rubinius',
      ]

      assert_equal expected, actual
    end

    it "accepts a nil value" do
      assert_equal [], Salvage::Utils.envvar_to_array(nil)
    end
  end
end
