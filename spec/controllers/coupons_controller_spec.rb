require 'spec_helper'

describe CouponsController do

  # This should return the minimal set of attributes required to create a valid
  # Coupon. As you add validations to Coupon, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:code => 'TESTABC', :expired_at => '09/10/1900'}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CouponsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all coupons as @coupons" do
      coupon = Coupon.create! valid_attributes
      get :index, {}, valid_session
      assigns(:coupons).should eq([coupon])
    end
  end

  describe "GET show" do
    it "assigns the requested coupon as @coupon" do
      coupon = Coupon.create! valid_attributes
      get :show, {:id => coupon.to_param}, valid_session
      assigns(:coupon).should eq(coupon)
    end
  end

  describe "GET new" do
    it "assigns a new coupon as @coupon" do
      get :new, {:coupon_type => 'DollarOffCoupon'}, valid_session
      assigns(:coupon).should be_a_new(Coupon)
    end
  end

  describe "GET edit" do
    it "assigns the requested coupon as @coupon" do
      coupon = Coupon.create! valid_attributes
      get :edit, {:id => coupon.to_param}, valid_session
      assigns(:coupon).should eq(coupon)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Coupon" do
        expect {
          post :create, {:coupon_type => :coupon, :coupon => valid_attributes}, valid_session
        }.to change(Coupon, :count).by(1)
      end

      it "assigns a newly created coupon as @coupon" do
        post :create, {:coupon_type => :coupon, :coupon => valid_attributes}, valid_session
        assigns(:coupon).should be_a(Coupon)
        assigns(:coupon).should be_persisted
      end

      it "redirects to the created coupon" do
        post :create, {:coupon_type => :coupon, :coupon => valid_attributes}, valid_session
        response.should redirect_to(Coupon.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved coupon as @coupon" do
        # Trigger the behavior that occurs when invalid params are submitted
        Coupon.any_instance.stub(:save).and_return(false)
        post :create, {:coupon_type => :coupon, :coupon => {:expired_at => '10/11/1988'}}, valid_session
        assigns(:coupon).should be_a_new(Coupon)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Coupon.any_instance.stub(:save).and_return(false)
        post :create, {:coupon_type => :coupon, :coupon => {:expired_at => '10/11/1988'}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "assigns the requested coupon as @coupon" do
        coupon = Coupon.create! valid_attributes
        put :update, {:id => coupon.to_param, :coupon_type => :coupon, :coupon => valid_attributes}, valid_session
        assigns(:coupon).should eq(coupon)
      end

      it "redirects to the coupon" do
        coupon = Coupon.create! valid_attributes
        put :update, {:id => coupon.to_param, :coupon_type => :coupon, :coupon => valid_attributes}, valid_session
        response.should redirect_to(coupon)
      end
    end

    describe "with invalid params" do
      it "assigns the coupon as @coupon" do
        coupon = Coupon.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Coupon.any_instance.stub(:save).and_return(false)
        put :update, {:id => coupon.to_param, :coupon => {}}, valid_session
        assigns(:coupon).should eq(coupon)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested coupon" do
      coupon = Coupon.create! valid_attributes
      expect {
        delete :destroy, {:id => coupon.to_param}, valid_session
      }.to change(Coupon, :count).by(-1)
    end

    it "redirects to the coupons list" do
      coupon = Coupon.create! valid_attributes
      delete :destroy, {:id => coupon.to_param}, valid_session
      response.should redirect_to(coupons_url)
    end
  end

end
