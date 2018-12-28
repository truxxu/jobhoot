require 'test_helper'

class TraitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @trait = Trait.new(name: "Doer", description: "something")
  end

  test "should be valid" do
    assert @trait.valid?, @trait.errors.full_messages
  end

  test "name should be present" do
    @trait.name = nil
    assert_not @trait.valid?, @trait.errors.full_messages
  end

  test "category should be present" do
    @trait.description = nil
    assert_not @trait.valid?, @trait.errors.full_messages
  end
end
