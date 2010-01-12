require 'test_helper'

class ContestantsControllerTest < ActionController::TestCase
  test "should show index" do
    get :index, :show_id => shows(:one)
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:contestants)
  end
  
  test "should show new form" do
    get :new, :show_id => shows(:one)
    assert_response :success
    assert_template :new
    assert_not_nil assigns(:contestant)
    assert_select 'form p', :count => 2
  end
  
  test "should show edit form" do
    get :edit, :id => contestants(:jim)
    assert_response :success
    assert_template :edit
    assert_not_nil assigns(:contestant)
    assert_select 'form p', :count => 2
  end
  
  test "should show indivdual contestant page" do
    get :show, :id => contestants(:jim)
    assert_response :success
    assert_template :show
    assert_select 'h2#contestant_name', contestants(:jim).name
  end
  
  test "should add contestant" do
    post :create, :contestant => { 
      :name => 'Test contestant' 
      }, :show_id => shows(:one)
    assert ! assigns(:contestant).new_record?
    assert_redirected_to show_path(assigns(:show))
    assert_not_nil flash[:notice]
  end
  
  test "should reject missing contestant attribute" do
    post :create, :contestant => {
      :name => nil
    }, :show_id => shows(:one)
    assert assigns(:contestant).errors.on(:name)
  end
  
  test "should redirect after deleting" do
    show = contestants(:jim).show.id
    assert_difference('Contestant.count', -1) do
       delete :destroy, :id => contestants(:jim).id
    end
    assert_redirected_to show_path(show)
  end
end
