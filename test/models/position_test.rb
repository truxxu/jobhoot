require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @position = Position.new(title: "Manager")
  end

  test "should be valid" do
    assert @position.valid?, @position.errors.full_messages
  end
end
