require 'test_helper'

class PeopleControllerTest < ActionController::TestCase

  def setup
    10.times { create(:person) }
    @person = Person.first
  end

  test 'GET index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
    assert_select 'h1', 'People'
    assert_select 'a', 'New Person'
  end

  test 'GET new' do
    get :new
    assert_response :success
    assert_template :new
    assert_template layout: 'layouts/application', partial: '_form'
    assert_select 'a', 'People list'
  end

  test 'assigns a new person as @person' do
    get :new
    person = assigns(:person)
    assert_not_nil person
    assert_not person.persisted?
  end

  test 'GET EDIT assigns the requested person as @person' do
    get :edit, id: @person.to_param
    assert assigns(:person), @person
    assert_template :edit
    assert_template layout: 'layouts/application', partial: '_form'
  end

  test 'GET show' do
    get :show, id: @person.to_param
    assert_response :success
    assert_not_nil assigns(:person)
    assert_equal assigns(:person), @person
  end

  test 'POST create: create a new person' do
    assert_difference ('Person.count') do
      post :create, person: attributes_for(:person)
    end
    assert_redirected_to person_path(assigns(:person))
    assert_equal 'Person saved successfuly', flash[:notice]
  end

  test 'PUT update - update a person information' do
    first_name = Faker::Name.first_name
    put :update, id: @person.id,
      person: attributes_for(:person, first_name: first_name )
    assert_equal first_name, @person.reload.first_name
    assert_redirected_to person_path(assigns(:person))
    assert_equal 'Person saved successfuly', flash[:notice]
  end

  test 'PUT update - render form when updated not posible' do
    put :update, id: @person.id,
      person: attributes_for(:person, first_name: nil )
    assert_template :edit
    assert_equal "First name can't be blank", flash[:error]
  end

  test 'DELETE destroy - destroy a person' do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person.id
    end
    assert_redirected_to people_path(assigns(:people))
    assert_equal 'Person deleted successfuly', flash[:notice]
  end
end
