require 'spec_helper'


describe LeasesController do

  # This should return the minimal set of attributes required to create a valid
  # Lease. As you add validations to Lease, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LeasesController. Be sure to keep this updated too.
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
    it "assigns all leases as @leases" do
      lease = Lease.create! valid_attributes
      get :index, {}, valid_session
      assigns(:leases).should eq([lease])
    end
  end

  describe "GET show" do
    it "assigns the requested lease as @lease" do
      lease = Lease.create! valid_attributes
      get :show, {:id => lease.to_param}, valid_session
      assigns(:lease).should eq(lease)
    end
  end

  describe "GET new" do
    it "assigns a new lease as @lease" do
      get :new, {}, valid_session
      assigns(:lease).should be_a_new(Lease)
    end
  end

  describe "GET edit" do
    it "assigns the requested lease as @lease" do
      lease = Lease.create! valid_attributes
      get :edit, {:id => lease.to_param}, valid_session
      assigns(:lease).should eq(lease)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Lease" do
        expect {
          post :create, {:lease => valid_attributes}, valid_session
        }.to change(Lease, :count).by(1)
      end

      it "assigns a newly created lease as @lease" do
        post :create, {:lease => valid_attributes}, valid_session
        assigns(:lease).should be_a(Lease)
        assigns(:lease).should be_persisted
      end

      it "redirects to the created lease" do
        post :create, {:lease => valid_attributes}, valid_session
        response.should redirect_to(Lease.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lease as @lease" do
        # Trigger the behavior that occurs when invalid params are submitted
        Lease.any_instance.stub(:save).and_return(false)
        post :create, {:lease => {}}, valid_session
        assigns(:lease).should be_a_new(Lease)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Lease.any_instance.stub(:save).and_return(false)
        post :create, {:lease => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested lease" do
        lease = Lease.create! valid_attributes
        # Assuming there are no other leases in the database, this
        # specifies that the Lease created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Lease.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => lease.to_param, :lease => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested lease as @lease" do
        lease = Lease.create! valid_attributes
        put :update, {:id => lease.to_param, :lease => valid_attributes}, valid_session
        assigns(:lease).should eq(lease)
      end

      it "redirects to the lease" do
        lease = Lease.create! valid_attributes
        put :update, {:id => lease.to_param, :lease => valid_attributes}, valid_session
        response.should redirect_to(lease)
      end
    end

    describe "with invalid params" do
      it "assigns the lease as @lease" do
        lease = Lease.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Lease.any_instance.stub(:save).and_return(false)
        put :update, {:id => lease.to_param, :lease => {}}, valid_session
        assigns(:lease).should eq(lease)
      end

      it "re-renders the 'edit' template" do
        lease = Lease.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Lease.any_instance.stub(:save).and_return(false)
        put :update, {:id => lease.to_param, :lease => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested lease" do
      lease = Lease.create! valid_attributes
      expect {
        delete :destroy, {:id => lease.to_param}, valid_session
      }.to change(Lease, :count).by(-1)
    end

    it "redirects to the leases list" do
      lease = Lease.create! valid_attributes
      delete :destroy, {:id => lease.to_param}, valid_session
      response.should redirect_to(leases_url)
    end
  end

end
