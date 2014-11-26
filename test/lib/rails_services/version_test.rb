require_relative '../../test_helper'
require_relative '../../../lib/rails_services/version'

class VersionTest < Minitest::Test

  def test_version
    refute_nil RailsServices::VERSION
  end
end