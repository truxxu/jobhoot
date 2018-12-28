require 'test_helper'

class HobbyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @hobby = Hobby.new(name: "Drawing", category: "something")
  end

  test "should be valid" do
    assert @hobby.valid?, @hobby.errors.full_messages
  end

  test "name should be present" do
    @hobby.name = nil
    assert_not @hobby.valid?, @hobby.errors.full_messages
  end

  test "category should be present" do
    @hobby.category = nil
    assert_not @hobby.valid?, @hobby.errors.full_messages
  end
end
