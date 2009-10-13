require 'spec_helper'

describe PathsController do

  def mock_path(stubs={})
    @mock_path ||= mock_model(Path, stubs)
  end

  describe "GET index" do
    it "assigns all paths as @paths" do
      Path.stub!(:find).with(:all).and_return([mock_path])
      get :index
      assigns[:paths].should == [mock_path]
    end
  end

  describe "GET show" do
    it "assigns the requested path as @path" do
      Path.stub!(:find).with("37").and_return(mock_path)
      get :show, :id => "37"
      assigns[:path].should equal(mock_path)
    end
  end

  describe "GET new" do
    it "assigns a new path as @path" do
      Path.stub!(:new).and_return(mock_path)
      get :new
      assigns[:path].should equal(mock_path)
    end
  end

  describe "GET edit" do
    it "assigns the requested path as @path" do
      Path.stub!(:find).with("37").and_return(mock_path)
      get :edit, :id => "37"
      assigns[:path].should equal(mock_path)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created path as @path" do
        Path.stub!(:new).with({'these' => 'params'}).and_return(mock_path(:save => true))
        post :create, :path => {:these => 'params'}
        assigns[:path].should equal(mock_path)
      end

      it "redirects to the created path" do
        Path.stub!(:new).and_return(mock_path(:save => true))
        post :create, :path => {}
        response.should redirect_to(path_url(mock_path))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved path as @path" do
        Path.stub!(:new).with({'these' => 'params'}).and_return(mock_path(:save => false))
        post :create, :path => {:these => 'params'}
        assigns[:path].should equal(mock_path)
      end

      it "re-renders the 'new' template" do
        Path.stub!(:new).and_return(mock_path(:save => false))
        post :create, :path => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested path" do
        Path.should_receive(:find).with("37").and_return(mock_path)
        mock_path.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :path => {:these => 'params'}
      end

      it "assigns the requested path as @path" do
        Path.stub!(:find).and_return(mock_path(:update_attributes => true))
        put :update, :id => "1"
        assigns[:path].should equal(mock_path)
      end

      it "redirects to the path" do
        Path.stub!(:find).and_return(mock_path(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(path_url(mock_path))
      end
    end

    describe "with invalid params" do
      it "updates the requested path" do
        Path.should_receive(:find).with("37").and_return(mock_path)
        mock_path.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :path => {:these => 'params'}
      end

      it "assigns the path as @path" do
        Path.stub!(:find).and_return(mock_path(:update_attributes => false))
        put :update, :id => "1"
        assigns[:path].should equal(mock_path)
      end

      it "re-renders the 'edit' template" do
        Path.stub!(:find).and_return(mock_path(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested path" do
      Path.should_receive(:find).with("37").and_return(mock_path)
      mock_path.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the paths list" do
      Path.stub!(:find).and_return(mock_path(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(paths_url)
    end
  end

end
