require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

  describe "GET index" do
    it "assigns @groups and render template" do
      group1 = Group.create(title: "qq", description: "ww")
      group2 = Group.create(title: "bar", description: "foo")
      get :index
      expect(assigns[:groups]).to eq([group1,group2])
    end
    end
  end
