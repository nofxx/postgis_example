require 'spec_helper'

describe MarksController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/marks" }.should route_to(:controller => "marks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/marks/new" }.should route_to(:controller => "marks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/marks/1" }.should route_to(:controller => "marks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/marks/1/edit" }.should route_to(:controller => "marks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/marks" }.should route_to(:controller => "marks", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/marks/1" }.should route_to(:controller => "marks", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/marks/1" }.should route_to(:controller => "marks", :action => "destroy", :id => "1") 
    end
  end
end
