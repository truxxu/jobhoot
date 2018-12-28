require 'test_helper'

class OtherStudyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @other_study = OtherStudy.new(title: "Stamp Collector")
  end

  test "should be valid" do
    assert @other_study.valid?, @other_study.errors.full_messages
  end
end
