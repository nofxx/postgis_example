require 'spec_helper'

describe RegionsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/regions" }.should route_to(:controller => "regions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/regions/new" }.should route_to(:controller => "regions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/regions/1" }.should route_to(:controller => "regions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/regions/1/edit" }.should route_to(:controller => "regions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/regions" }.should route_to(:controller => "regions", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/regions/1" }.should route_to(:controller => "regions", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/regions/1" }.should route_to(:controller => "regions", :action => "destroy", :id => "1") 
    end
  end
end
