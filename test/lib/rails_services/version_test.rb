require 'minitest/autorun'

class VersionTest < Minitest::Test

  def test_version
    refute_nil RailsServices::VERSION
  end
end