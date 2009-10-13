require 'spec_helper'

describe RegionsController do

  def mock_region(stubs={})
    @mock_region ||= mock_model(Region, stubs)
  end

  describe "GET index" do
    it "assigns all regions as @regions" do
      Region.stub!(:find).with(:all).and_return([mock_region])
      get :index
      assigns[:regions].should == [mock_region]
    end
  end

  describe "GET show" do
    it "assigns the requested region as @region" do
      Region.stub!(:find).with("37").and_return(mock_region)
      get :show, :id => "37"
      assigns[:region].should equal(mock_region)
    end
  end

  describe "GET new" do
    it "assigns a new region as @region" do
      Region.stub!(:new).and_return(mock_region)
      get :new
      assigns[:region].should equal(mock_region)
    end
  end

  describe "GET edit" do
    it "assigns the requested region as @region" do
      Region.stub!(:find).with("37").and_return(mock_region)
      get :edit, :id => "37"
      assigns[:region].should equal(mock_region)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created region as @region" do
        Region.stub!(:new).with({'these' => 'params'}).and_return(mock_region(:save => true))
        post :create, :region => {:these => 'params'}
        assigns[:region].should equal(mock_region)
      end

      it "redirects to the created region" do
        Region.stub!(:new).and_return(mock_region(:save => true))
        post :create, :region => {}
        response.should redirect_to(region_url(mock_region))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved region as @region" do
        Region.stub!(:new).with({'these' => 'params'}).and_return(mock_region(:save => false))
        post :create, :region => {:these => 'params'}
        assigns[:region].should equal(mock_region)
      end

      it "re-renders the 'new' template" do
        Region.stub!(:new).and_return(mock_region(:save => false))
        post :create, :region => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested region" do
        Region.should_receive(:find).with("37").and_return(mock_region)
        mock_region.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :region => {:these => 'params'}
      end

      it "assigns the requested region as @region" do
        Region.stub!(:find).and_return(mock_region(:update_attributes => true))
        put :update, :id => "1"
        assigns[:region].should equal(mock_region)
      end

      it "redirects to the region" do
        Region.stub!(:find).and_return(mock_region(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(region_url(mock_region))
      end
    end

    describe "with invalid params" do
      it "updates the requested region" do
        Region.should_receive(:find).with("37").and_return(mock_region)
        mock_region.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :region => {:these => 'params'}
      end

      it "assigns the region as @region" do
        Region.stub!(:find).and_return(mock_region(:update_attributes => false))
        put :update, :id => "1"
        assigns[:region].should equal(mock_region)
      end

      it "re-renders the 'edit' template" do
        Region.stub!(:find).and_return(mock_region(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested region" do
      Region.should_receive(:find).with("37").and_return(mock_region)
      mock_region.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the regions list" do
      Region.stub!(:find).and_return(mock_region(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(regions_url)
    end
  end

end
