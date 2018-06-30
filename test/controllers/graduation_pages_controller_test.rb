require 'test_helper'

class GraduationPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get graduation_pages_home_url
    assert_response :success
  end

  test "should get result" do
    get graduation_pages_result_url
    assert_response :success
  end

end
