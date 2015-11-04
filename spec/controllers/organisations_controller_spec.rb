require 'rails_helper'

RSpec.describe OrganisationsController, type: :controller do
  describe "GET #index" do
    it "returns a http success" do
      get :index
      expect(response).to have_http_status :success
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    context "valid parameter" do
      it "assigns the expected organisation" do
        organisation = FactoryGirl.create(:organisation)
        get :show, id: organisation
        expect(assigns(:organisation)).to eq(organisation)
      end

      it "renders the #show view" do
        get :show, id: FactoryGirl.create(:organisation)
        expect(response).to render_template :show
      end
    end

    context "invalid parameter" do
      it "redirects to #index" do
        get :show, id: 100000
        expect(response).to redirect_to(organisations_path)
      end
    end
  end
  
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves an organisation to the database" do
        expect {
          post :create, organisation: FactoryGirl.attributes_for(:organisation)
        }.to change(Organisation, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save an organisation to the database" do
        expect {
          post :create, organisation: FactoryGirl.attributes_for(:invalid_organisation)
        }.to_not change(Organisation, :count)
      end

      it "re-renders the :new template" do
        post :create, organisation: FactoryGirl.attributes_for(:invalid_organisation)
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    context "with valid argument" do
      it "returns a http success" do
        organisation = FactoryGirl.create(:organisation)
        get :edit, id: organisation
        expect(response).to have_http_status :success
      end

      it "renders the #edit view" do
        organisation = FactoryGirl.create(:organisation)
        get :edit, id: organisation
        expect(response).to render_template :edit
      end
    end

    context "with invalid argument" do
      it "redirects to #index" do
        get :edit, id: 10000
        expect(response).to redirect_to(organisations_path)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid argument" do
      it "redirects to the organisation" do
        organisation = FactoryGirl.create(:organisation)
        contact = FactoryGirl.create(:contact, organisation: organisation)
        patch :update, { id: organisation.id, organisation: { name: "updated name" } }
        expect(response).to redirect_to(organisation)
      end

      it "modifies an organisation" do
        organisation = FactoryGirl.create(:organisation)
        patch :update, { id: organisation.id, organisation: { name: "updated name" } }
        organisation.reload
        expect(organisation.name).to eq("updated name")
      end
    end

    context "with invalid argument" do
      it "redirects to #index" do
        put :update, id: 10000
        expect(response).to redirect_to(organisations_path)
      end
    end
  end
end
