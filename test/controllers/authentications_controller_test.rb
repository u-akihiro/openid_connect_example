require 'test_helper'

class AuthenticationsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "redirect to google's auth endpoint" do
    get login_url
    assert_redirected_to 'https://accounts.google.com/o/oauth2/v2/auth'
  end
end
