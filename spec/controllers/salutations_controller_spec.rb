require 'spec_helper'


describe SalutationsController do

  # This should return the minimal set of attributes required to create a valid
  # Salutation. As you add validations to Salutation, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:salutation => "salutation",
     :language => Salutation::LANGUAGES[0],
     :display_order => 1}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SalutationsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = Factory.create(:user)
    sign_in @user
    controller.stub(:authenticate_user!).and_return true
  end
  
  describe "GET index" do
    it "assigns all salutations as @salutations" do
      salutation = Salutation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:salutations).should eq([salutation])
    end
  end

  describe "GET show" do
    it "assigns the requested salutation as @salutation" do
      salutation = Salutation.create! valid_attributes
      get :show, {:id => salutation.to_param}, valid_session
      assigns(:salutation).should eq(salutation)
    end
  end

  describe "GET new" do
    it "assigns a new salutation as @salutation" do
      get :new, {}, valid_session
      assigns(:salutation).should be_a_new(Salutation)
    end
  end

  describe "GET edit" do
    it "assigns the requested salutation as @salutation" do
      salutation = Salutation.create! valid_attributes
      get :edit, {:id => salutation.to_param}, valid_session
      assigns(:salutation).should eq(salutation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Salutation" do
        expect {
          post :create, {:salutation => valid_attributes}, valid_session
        }.to change(Salutation, :count).by(1)
      end

      it "assigns a newly created salutation as @salutation" do
        post :create, {:salutation => valid_attributes}, valid_session
        assigns(:salutation).should be_a(Salutation)
        assigns(:salutation).should be_persisted
      end

      it "redirects to the created salutation" do
        post :create, {:salutation => valid_attributes}, valid_session
        response.should redirect_to(Salutation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved salutation as @salutation" do
        # Trigger the behavior that occurs when invalid params are submitted
        Salutation.any_instance.stub(:save).and_return(false)
        post :create, {:salutation => {}}, valid_session
        assigns(:salutation).should be_a_new(Salutation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Salutation.any_instance.stub(:save).and_return(false)
        post :create, {:salutation => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested salutation" do
        salutation = Salutation.create! valid_attributes
        # Assuming there are no other salutations in the database, this
        # specifies that the Salutation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Salutation.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => salutation.to_param, :salutation => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested salutation as @salutation" do
        salutation = Salutation.create! valid_attributes
        put :update, {:id => salutation.to_param, :salutation => valid_attributes}, valid_session
        assigns(:salutation).should eq(salutation)
      end

      it "redirects to the salutation" do
        salutation = Salutation.create! valid_attributes
        put :update, {:id => salutation.to_param, :salutation => valid_attributes}, valid_session
        response.should redirect_to(salutation)
      end
    end

    describe "with invalid params" do
      it "assigns the salutation as @salutation" do
        salutation = Salutation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Salutation.any_instance.stub(:save).and_return(false)
        put :update, {:id => salutation.to_param, :salutation => {}}, valid_session
        assigns(:salutation).should eq(salutation)
      end

      it "re-renders the 'edit' template" do
        salutation = Salutation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Salutation.any_instance.stub(:save).and_return(false)
        put :update, {:id => salutation.to_param, :salutation => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested salutation" do
      salutation = Salutation.create! valid_attributes
      expect {
        delete :destroy, {:id => salutation.to_param}, valid_session
      }.to change(Salutation, :count).by(-1)
    end

    it "redirects to the salutations list" do
      salutation = Salutation.create! valid_attributes
      delete :destroy, {:id => salutation.to_param}, valid_session
      response.should redirect_to(salutations_url)
    end
  end

end
