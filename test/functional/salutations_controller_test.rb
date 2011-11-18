require 'test_helper'

class SalutationsControllerTest < ActionController::TestCase
  setup do
    @salutation = salutations(:one)
    @sal3 = salutations(:three)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salutations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salutation" do
    assert_difference('Salutation.count') do
      post :create, salutation: @salutation.attributes
    end

    assert_redirected_to salutation_path(assigns(:salutation))
  end

  test "should show salutation" do
    get :show, id: @salutation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salutation.to_param
    assert_response :success
  end

  test "should update salutation" do
    put :update, id: @salutation.to_param, salutation: @salutation.attributes
    assert_redirected_to salutation_path(assigns(:salutation))
  end

  test "should destroy salutation" do
    assert_difference('Salutation.count', -1) do
      delete :destroy, id: @sal3.to_param
    end

    assert_redirected_to salutations_path
  end
end
