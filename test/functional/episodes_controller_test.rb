require 'test_helper'

class EpisodesControllerTest < ActionController::TestCase
  test "should show index" do
    get :index, :show_id => shows(:one)
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:episodes)
  end
  
  test "should show new" do
    get :new, :show_id => shows(:one)
    assert_response :success
    assert_template :new
    assert_not_nil assigns(:episode)
  end
  
  test "should show new form" do
    get :new, :show_id => shows(:one)
    assert_select 'form p', :count => 3
  end
  
  test "should add episode" do
    post :create, :episode => { 
      :name => 'Test episode',
      :date => '2010-01-12 14:19:02' 
      }, :show_id => shows(:one)
    assert ! assigns(:episode).new_record?
    assert_redirected_to show_path(assigns(:show))
    assert_not_nil flash[:notice]
  end
  
  test "should reject missing episode attribute" do
    post :create, :episode => {
      :name => "Test episode"
    }, :show_id => shows(:one)
    assert assigns(:episode).errors.on(:date)
  end
  
  test "should redirect after deleting" do
    show = episodes(:week_one).show.id
    assert_difference('Episode.count', -1) do
       delete :destroy, :id => episodes(:week_one).id
    end
    assert_redirected_to show_path(show)
  end
  
  test "should show list of episode's contestants" do
    get :show, :id => episodes(:week_one)
    assert_response :success
    assert_template :show
    assert_select 'h2#episode_name', episodes(:week_one).name
    assert_select 'div.vote_form', :count => 2
  end
end