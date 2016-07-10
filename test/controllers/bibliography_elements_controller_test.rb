require 'test_helper'

class BibliographyElementsControllerTest < ActionController::TestCase
  setup do
    @bibliography_element = bibliography_elements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bibliography_elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bibliography_element" do
    assert_difference('BibliographyElement.count') do
      post :create, bibliography_element: { description: @bibliography_element.description, friendly_name: @bibliography_element.friendly_name, source: @bibliography_element.source }
    end

    assert_redirected_to bibliography_element_path(assigns(:bibliography_element))
  end

  test "should show bibliography_element" do
    get :show, id: @bibliography_element
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bibliography_element
    assert_response :success
  end

  test "should update bibliography_element" do
    patch :update, id: @bibliography_element, bibliography_element: { description: @bibliography_element.description, friendly_name: @bibliography_element.friendly_name, source: @bibliography_element.source }
    assert_redirected_to bibliography_element_path(assigns(:bibliography_element))
  end

  test "should destroy bibliography_element" do
    assert_difference('BibliographyElement.count', -1) do
      delete :destroy, id: @bibliography_element
    end

    assert_redirected_to bibliography_elements_path
  end
end
