require 'test_helper'

class PDetailsControllerTest < ActionController::TestCase
  setup do
    @p_detail = p_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:p_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create p_detail" do
    assert_difference('PDetail.count') do
      post :create, p_detail: { product_id: @p_detail.product_id, purchase_id: @p_detail.purchase_id, quantity: @p_detail.quantity, unit_price: @p_detail.unit_price }
    end

    assert_redirected_to p_detail_path(assigns(:p_detail))
  end

  test "should show p_detail" do
    get :show, id: @p_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @p_detail
    assert_response :success
  end

  test "should update p_detail" do
    put :update, id: @p_detail, p_detail: { product_id: @p_detail.product_id, purchase_id: @p_detail.purchase_id, quantity: @p_detail.quantity, unit_price: @p_detail.unit_price }
    assert_redirected_to p_detail_path(assigns(:p_detail))
  end

  test "should destroy p_detail" do
    assert_difference('PDetail.count', -1) do
      delete :destroy, id: @p_detail
    end

    assert_redirected_to p_details_path
  end
end
