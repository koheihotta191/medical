require "test_helper"

class MedicalRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get medical_records_index_url
    assert_response :success
  end

  test "should get new" do
    get medical_records_new_url
    assert_response :success
  end

  test "should get create" do
    get medical_records_create_url
    assert_response :success
  end

  test "should get show" do
    get medical_records_show_url
    assert_response :success
  end

  test "should get edit" do
    get medical_records_edit_url
    assert_response :success
  end

  test "should get update" do
    get medical_records_update_url
    assert_response :success
  end

  test "should get destroy" do
    get medical_records_destroy_url
    assert_response :success
  end
end
