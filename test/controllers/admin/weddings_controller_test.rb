require 'test_helper'

class Admin::WeddingsControllerTest < ActionController::TestCase

	context "a guest user" do
		
	  setup do
	    @wedding = FactoryGirl.create(:wedding)
	  end

	  should "get redirected on index" do
	    get :index
	    assert deny_access
	  end

	  should "get redirected on new" do
	    get :new
	    assert deny_access
	  end

	  should "get redirected on create" do
	    post :create, wedding: {  }
	    assert deny_access
	  end

	  should "get redirected on show" do
	    get :show, id: @wedding
	    assert deny_access
	  end

	  should "get redirected on edit" do
	    get :edit, id: @wedding
	    assert deny_access
	  end

	  should "get redirected on update" do
	    patch :update, id: @wedding, wedding: {  }
	    assert deny_access
	  end

	  should "get redirected on destroy" do
	    delete :destroy, id: @wedding
	    assert deny_access
	  end
	end
end