require 'spec_helper'

describe LineItemsController do

  # This should return the minimal set of attributes required to create a valid
  # LineItem. As you add validations to LineItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {:quantity => 100} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LineItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all line_items as @line_items" do
      line_item = LineItem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:line_items).should eq([line_item])
    end
  end

  describe "GET show" do
    it "assigns the requested line_item as @line_item" do
      line_item = LineItem.create! valid_attributes
      get :show, {:id => line_item.to_param}, valid_session
      assigns(:line_item).should eq(line_item)
    end
  end

  describe "GET new" do
    it "assigns a new line_item as @line_item" do
      get :new, {}, valid_session
      assigns(:line_item).should be_a_new(LineItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested line_item as @line_item" do
      line_item = LineItem.create! valid_attributes
      get :edit, {:id => line_item.to_param}, valid_session
      assigns(:line_item).should eq(line_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LineItem" do
        expect {
          post :create, {:line_item => valid_attributes}, valid_session
        }.to change(LineItem, :count).by(1)
      end

      it "assigns a newly created line_item as @line_item" do
        post :create, {:line_item => valid_attributes}, valid_session
        assigns(:line_item).should be_a(LineItem)
        assigns(:line_item).should be_persisted
      end

      it "redirects to the created line_item" do
        post :create, {:line_item => valid_attributes}, valid_session
        response.should redirect_to(LineItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved line_item as @line_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        LineItem.any_instance.stub(:save).and_return(false)
        post :create, {:line_item => {  }}, valid_session
        assigns(:line_item).should be_a_new(LineItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        LineItem.any_instance.stub(:save).and_return(false)
        post :create, {:line_item => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "assigns the requested line_item as @line_item" do
        line_item = LineItem.create! valid_attributes
        put :update, {:id => line_item.to_param, :line_item => valid_attributes}, valid_session
        assigns(:line_item).should eq(line_item)
      end

      it "redirects to the line_item" do
        line_item = LineItem.create! valid_attributes
        put :update, {:id => line_item.to_param, :line_item => valid_attributes}, valid_session
        response.should redirect_to(line_item)
      end
    end

    describe "with invalid params" do
      it "assigns the line_item as @line_item" do
        line_item = LineItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LineItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => line_item.to_param, :line_item => {  }}, valid_session
        assigns(:line_item).should eq(line_item)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested line_item" do
      line_item = LineItem.create! valid_attributes
      expect {
        delete :destroy, {:id => line_item.to_param}, valid_session
      }.to change(LineItem, :count).by(-1)
    end

    it "redirects to the line_items list" do
      line_item = LineItem.create! valid_attributes
      delete :destroy, {:id => line_item.to_param}, valid_session
      response.should redirect_to(line_items_url)
    end
  end

end
