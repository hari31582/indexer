require 'test_helper'

class SearchServersControllerTest < ActionController::TestCase
  setup do
    @search_server = search_servers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_servers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_server" do
    assert_difference('SearchServer.count') do
      post :create, :search_server => @search_server.attributes
    end

    assert_redirected_to search_server_path(assigns(:search_server))
  end

  test "should show search_server" do
    get :show, :id => @search_server.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @search_server.to_param
    assert_response :success
  end

  test "should update search_server" do
    put :update, :id => @search_server.to_param, :search_server => @search_server.attributes
    assert_redirected_to search_server_path(assigns(:search_server))
  end

  test "should destroy search_server" do
    assert_difference('SearchServer.count', -1) do
      delete :destroy, :id => @search_server.to_param
    end

    assert_redirected_to search_servers_path
  end
end
