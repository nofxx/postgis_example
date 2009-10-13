require 'spec_helper'

describe MarksController do

  def mock_mark(stubs={})
    @mock_mark ||= mock_model(Mark, stubs)
  end

  describe "GET index" do
    it "assigns all marks as @marks" do
      Mark.stub!(:find).with(:all).and_return([mock_mark])
      get :index
      assigns[:marks].should == [mock_mark]
    end
  end

  describe "GET show" do
    it "assigns the requested mark as @mark" do
      Mark.stub!(:find).with("37").and_return(mock_mark)
      get :show, :id => "37"
      assigns[:mark].should equal(mock_mark)
    end
  end

  describe "GET new" do
    it "assigns a new mark as @mark" do
      Mark.stub!(:new).and_return(mock_mark)
      get :new
      assigns[:mark].should equal(mock_mark)
    end
  end

  describe "GET edit" do
    it "assigns the requested mark as @mark" do
      Mark.stub!(:find).with("37").and_return(mock_mark)
      get :edit, :id => "37"
      assigns[:mark].should equal(mock_mark)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created mark as @mark" do
        Mark.stub!(:new).with({'these' => 'params'}).and_return(mock_mark(:save => true))
        post :create, :mark => {:these => 'params'}
        assigns[:mark].should equal(mock_mark)
      end

      it "redirects to the created mark" do
        Mark.stub!(:new).and_return(mock_mark(:save => true))
        post :create, :mark => {}
        response.should redirect_to(mark_url(mock_mark))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved mark as @mark" do
        Mark.stub!(:new).with({'these' => 'params'}).and_return(mock_mark(:save => false))
        post :create, :mark => {:these => 'params'}
        assigns[:mark].should equal(mock_mark)
      end

      it "re-renders the 'new' template" do
        Mark.stub!(:new).and_return(mock_mark(:save => false))
        post :create, :mark => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested mark" do
        Mark.should_receive(:find).with("37").and_return(mock_mark)
        mock_mark.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :mark => {:these => 'params'}
      end

      it "assigns the requested mark as @mark" do
        Mark.stub!(:find).and_return(mock_mark(:update_attributes => true))
        put :update, :id => "1"
        assigns[:mark].should equal(mock_mark)
      end

      it "redirects to the mark" do
        Mark.stub!(:find).and_return(mock_mark(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(mark_url(mock_mark))
      end
    end

    describe "with invalid params" do
      it "updates the requested mark" do
        Mark.should_receive(:find).with("37").and_return(mock_mark)
        mock_mark.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :mark => {:these => 'params'}
      end

      it "assigns the mark as @mark" do
        Mark.stub!(:find).and_return(mock_mark(:update_attributes => false))
        put :update, :id => "1"
        assigns[:mark].should equal(mock_mark)
      end

      it "re-renders the 'edit' template" do
        Mark.stub!(:find).and_return(mock_mark(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested mark" do
      Mark.should_receive(:find).with("37").and_return(mock_mark)
      mock_mark.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the marks list" do
      Mark.stub!(:find).and_return(mock_mark(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(marks_url)
    end
  end

end
