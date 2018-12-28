require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @language = Language.new(name: "French")
  end

  test "should be valid" do
    assert @language.valid?
  end
end
