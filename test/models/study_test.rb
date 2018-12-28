require 'test_helper'

class StudyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @study = Study.new(title: "Agronomics")
  end

  test "should have a title" do
    @study.title = nil
    assert_not @study.valid?, @study.errors.full_messages
  end
end
