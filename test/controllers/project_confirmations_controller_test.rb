require "test_helper"

class ProjectConfirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get project_confirmations_create_url
    assert_response :success
  end
end
