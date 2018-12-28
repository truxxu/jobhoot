require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @skill = Skill.new(name: "CAD Drawing", logo: "something.html")
  end

  test "should be valid" do
    assert @skill.valid?, @skill.errors.full_messages
  end

  test "name should be present" do
    @skill.name = nil
    assert_not @skill.valid?, @skill.errors.full_messages
  end

  # test "logo should be present" do
  #   @skill.logo = nil
  #   assert_not @skill.valid?, @skill.errors.full_messages
  # end
end
