require 'spec_helper'


describe RightsController do

  # This should return the minimal set of attributes required to create a valid
  # Right. As you add validations to Right, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:resource => 'resource', 
     :operation => Right::OPERATIONS_MAPPINGS.values[0]}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RightsController. Be sure to keep this updated too.
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
    it "assigns all rights as @rights" do
      right = Right.create! valid_attributes
      get :index, {}, valid_session
      assigns(:rights).should eq([right])
    end
  end

  describe "GET show" do
    it "assigns the requested right as @right" do
      right = Right.create! valid_attributes
      get :show, {:id => right.to_param}, valid_session
      assigns(:right).should eq(right)
    end
  end

  describe "GET new" do
    it "assigns a new right as @right" do
      get :new, {}, valid_session
      assigns(:right).should be_a_new(Right)
    end
  end

  describe "GET edit" do
    it "assigns the requested right as @right" do
      right = Right.create! valid_attributes
      get :edit, {:id => right.to_param}, valid_session
      assigns(:right).should eq(right)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Right" do
        expect {
          post :create, {:right => valid_attributes}, valid_session
        }.to change(Right, :count).by(1)
      end

      it "assigns a newly created right as @right" do
        post :create, {:right => valid_attributes}, valid_session
        assigns(:right).should be_a(Right)
        assigns(:right).should be_persisted
      end

      it "redirects to the created right" do
        post :create, {:right => valid_attributes}, valid_session
        response.should redirect_to(Right.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved right as @right" do
        # Trigger the behavior that occurs when invalid params are submitted
        Right.any_instance.stub(:save).and_return(false)
        post :create, {:right => {}}, valid_session
        assigns(:right).should be_a_new(Right)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Right.any_instance.stub(:save).and_return(false)
        post :create, {:right => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested right" do
        right = Right.create! valid_attributes
        # Assuming there are no other rights in the database, this
        # specifies that the Right created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Right.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => right.to_param, :right => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested right as @right" do
        right = Right.create! valid_attributes
        put :update, {:id => right.to_param, :right => valid_attributes}, valid_session
        assigns(:right).should eq(right)
      end

      it "redirects to the right" do
        right = Right.create! valid_attributes
        put :update, {:id => right.to_param, :right => valid_attributes}, valid_session
        response.should redirect_to(right)
      end
    end

    describe "with invalid params" do
      it "assigns the right as @right" do
        right = Right.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Right.any_instance.stub(:save).and_return(false)
        put :update, {:id => right.to_param, :right => {}}, valid_session
        assigns(:right).should eq(right)
      end

      it "re-renders the 'edit' template" do
        right = Right.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Right.any_instance.stub(:save).and_return(false)
        put :update, {:id => right.to_param, :right => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested right" do
      right = Right.create! valid_attributes
      expect {
        delete :destroy, {:id => right.to_param}, valid_session
      }.to change(Right, :count).by(-1)
    end

    it "redirects to the rights list" do
      right = Right.create! valid_attributes
      delete :destroy, {:id => right.to_param}, valid_session
      response.should redirect_to(rights_url)
    end
  end

end
