require 'test_helper'

class AaasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aaa = aaas(:one)
  end

  test "should get index" do
    get aaas_url
    assert_response :success
  end

  test "should get new" do
    get new_aaa_url
    assert_response :success
  end

  test "should create aaa" do
    assert_difference('Aaa.count') do
      post aaas_url, params: { aaa: { anm: @aaa.anm } }
    end

    assert_redirected_to aaa_url(Aaa.last)
  end

  test "should show aaa" do
    get aaa_url(@aaa)
    assert_response :success
  end

  test "should get edit" do
    get edit_aaa_url(@aaa)
    assert_response :success
  end

  test "should update aaa" do
    patch aaa_url(@aaa), params: { aaa: { anm: @aaa.anm } }
    assert_redirected_to aaa_url(@aaa)
  end

  test "should destroy aaa" do
    assert_difference('Aaa.count', -1) do
      delete aaa_url(@aaa)
    end

    assert_redirected_to aaas_url
  end
end
