require 'spec_helper'


describe PropertyTypesController do

  # This should return the minimal set of attributes required to create a valid
  # PropertyType. As you add validations to PropertyType, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:property_type => "ptype", 
     :description  => "description",
     :display_order => 1,}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PropertyTypesController. Be sure to keep this updated too.
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
    it "assigns all property_types as @property_types" do
      property_type = PropertyType.create! valid_attributes
      get :index, {}, valid_session
      assigns(:property_types).should eq([property_type])
    end
  end

  describe "GET show" do
    it "assigns the requested property_type as @property_type" do
      property_type = PropertyType.create! valid_attributes
      get :show, {:id => property_type.to_param}, valid_session
      assigns(:property_type).should eq(property_type)
    end
  end

  describe "GET new" do
    it "assigns a new property_type as @property_type" do
      get :new, {}, valid_session
      assigns(:property_type).should be_a_new(PropertyType)
    end
  end

  describe "GET edit" do
    it "assigns the requested property_type as @property_type" do
      property_type = PropertyType.create! valid_attributes
      get :edit, {:id => property_type.to_param}, valid_session
      assigns(:property_type).should eq(property_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PropertyType" do
        expect {
          post :create, {:property_type => valid_attributes}, valid_session
        }.to change(PropertyType, :count).by(1)
      end

      it "assigns a newly created property_type as @property_type" do
        post :create, {:property_type => valid_attributes}, valid_session
        assigns(:property_type).should be_a(PropertyType)
        assigns(:property_type).should be_persisted
      end

      it "redirects to the created property_type" do
        post :create, {:property_type => valid_attributes}, valid_session
        response.should redirect_to(PropertyType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved property_type as @property_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        PropertyType.any_instance.stub(:save).and_return(false)
        post :create, {:property_type => {}}, valid_session
        assigns(:property_type).should be_a_new(PropertyType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PropertyType.any_instance.stub(:save).and_return(false)
        post :create, {:property_type => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested property_type" do
        property_type = PropertyType.create! valid_attributes
        # Assuming there are no other property_types in the database, this
        # specifies that the PropertyType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PropertyType.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => property_type.to_param, :property_type => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested property_type as @property_type" do
        property_type = PropertyType.create! valid_attributes
        put :update, {:id => property_type.to_param, :property_type => valid_attributes}, valid_session
        assigns(:property_type).should eq(property_type)
      end

      it "redirects to the property_type" do
        property_type = PropertyType.create! valid_attributes
        put :update, {:id => property_type.to_param, :property_type => valid_attributes}, valid_session
        response.should redirect_to(property_type)
      end
    end

    describe "with invalid params" do
      it "assigns the property_type as @property_type" do
        property_type = PropertyType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PropertyType.any_instance.stub(:save).and_return(false)
        put :update, {:id => property_type.to_param, :property_type => {}}, valid_session
        assigns(:property_type).should eq(property_type)
      end

      it "re-renders the 'edit' template" do
        property_type = PropertyType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PropertyType.any_instance.stub(:save).and_return(false)
        put :update, {:id => property_type.to_param, :property_type => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested property_type" do
      property_type = PropertyType.create! valid_attributes
      expect {
        delete :destroy, {:id => property_type.to_param}, valid_session
      }.to change(PropertyType, :count).by(-1)
    end

    it "redirects to the property_types list" do
      property_type = PropertyType.create! valid_attributes
      delete :destroy, {:id => property_type.to_param}, valid_session
      response.should redirect_to(property_types_url)
    end
  end

end
