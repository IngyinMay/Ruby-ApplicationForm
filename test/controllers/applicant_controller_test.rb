require "test_helper"

class ApplicantControllerTest < ActionDispatch::IntegrationTest
  test "should get application_form" do
    get applicant_application_form_url
    assert_response :success
  end
end
