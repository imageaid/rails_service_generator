require_relative '../../test_helper'

class VersionTest < Minitest::Test

  def test_version
    refute_nil RailsServices::VERSION
  end
end