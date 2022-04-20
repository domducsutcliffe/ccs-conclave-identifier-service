require 'test_helper'

class IdentifiersTest < ActiveSupport::TestCase
  test "conclave identifier for single id" do
    identifier = Identifier.new
    assert_not identifier.save
  end
end
