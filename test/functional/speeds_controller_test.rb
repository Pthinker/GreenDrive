require 'test_helper'

class SpeedsControllerTest < ActionController::TestCase
  setup do
    @speed = speeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:speeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create speed" do
    assert_difference('Speed.count') do
      post :create, :speed => @speed.attributes
    end

    assert_redirected_to speed_path(assigns(:speed))
  end

  test "should show speed" do
    get :show, :id => @speed.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @speed.to_param
    assert_response :success
  end

  test "should update speed" do
    put :update, :id => @speed.to_param, :speed => @speed.attributes
    assert_redirected_to speed_path(assigns(:speed))
  end

  test "should destroy speed" do
    assert_difference('Speed.count', -1) do
      delete :destroy, :id => @speed.to_param
    end

    assert_redirected_to speeds_path
  end
end
