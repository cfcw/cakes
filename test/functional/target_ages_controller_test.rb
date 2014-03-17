require 'test_helper'

class TargetAgesControllerTest < ActionController::TestCase
  setup do
    @target_age = target_ages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:target_ages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create target_age" do
    assert_difference('TargetAge.count') do
      post :create, target_age: { target_age_range: @target_age.target_age_range }
    end

    assert_redirected_to target_age_path(assigns(:target_age))
  end

  test "should show target_age" do
    get :show, id: @target_age
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @target_age
    assert_response :success
  end

  test "should update target_age" do
    put :update, id: @target_age, target_age: { target_age_range: @target_age.target_age_range }
    assert_redirected_to target_age_path(assigns(:target_age))
  end

  test "should destroy target_age" do
    assert_difference('TargetAge.count', -1) do
      delete :destroy, id: @target_age
    end

    assert_redirected_to target_ages_path
  end
end
