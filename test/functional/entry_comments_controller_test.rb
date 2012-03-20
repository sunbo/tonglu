require 'test_helper'

class EntryCommentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:entry_comments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_entry_comment
    assert_difference('EntryComment.count') do
      post :create, :entry_comment => { }
    end

    assert_redirected_to entry_comment_path(assigns(:entry_comment))
  end

  def test_should_show_entry_comment
    get :show, :id => entry_comments(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => entry_comments(:one).id
    assert_response :success
  end

  def test_should_update_entry_comment
    put :update, :id => entry_comments(:one).id, :entry_comment => { }
    assert_redirected_to entry_comment_path(assigns(:entry_comment))
  end

  def test_should_destroy_entry_comment
    assert_difference('EntryComment.count', -1) do
      delete :destroy, :id => entry_comments(:one).id
    end

    assert_redirected_to entry_comments_path
  end
end
