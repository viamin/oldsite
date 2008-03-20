require File.dirname(__FILE__) + '/../test_helper'

class InviteesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:invitees)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_invitee
    assert_difference('Invitee.count') do
      post :create, :invitee => { }
    end

    assert_redirected_to invitee_path(assigns(:invitee))
  end

  def test_should_show_invitee
    get :show, :id => invitees(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => invitees(:one).id
    assert_response :success
  end

  def test_should_update_invitee
    put :update, :id => invitees(:one).id, :invitee => { }
    assert_redirected_to invitee_path(assigns(:invitee))
  end

  def test_should_destroy_invitee
    assert_difference('Invitee.count', -1) do
      delete :destroy, :id => invitees(:one).id
    end

    assert_redirected_to invitees_path
  end
end
