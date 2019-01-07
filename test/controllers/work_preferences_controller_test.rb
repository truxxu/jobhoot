require 'test_helper'

class WorkPreferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get work_preferences_new_url
    assert_response :success
  end

end
