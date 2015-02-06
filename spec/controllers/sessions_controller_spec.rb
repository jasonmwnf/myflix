require 'spec_helper'

describe SessionsController do 
  describe "GET new" do
    it "renders the new template for unauthenticated users" do 
      get :new
      expect(response).to render_template :new
    end

    it "redirects to the home page for authenticated users" do 
      session[:user_id] = Fabricate(:user).id 
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe "POST create" do
    context "has valid authentication" do
      it "puts the signed in user in the session" do 
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password
        expect(session[:user_id]).to eq(alice.id)
      end

      it "redirects to the home page" do 
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password
        expect(response).to redirect_to home_path
      end

      it "sets the flash message" do 
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password
        expect(flash[:warning]).not_to be_blank
      end
    end

    context "has invalid authentication" do 
      before do 
        alice = Fabricate(:user)
        post :create, email: alice.email, password: alice.password + 'asdfasdf'
      end

      it "does not put the signed in user in the session" do   
        expect(session[:user_id]).to be_nil
      end

      it "redirects to sign in page" do 
        expect(response).to redirect_to sign_in_path
      end
      
      it "sets the flash message" do 
        expect(flash[:danger]).not_to be_blank
      end 
    end
  end

  describe "GET destroy" do 
    before do
      session[:user_id] = Fabricate(:user).id 
      get :destroy
    end

    it "sets session id to nil" do 
      expect(session[:user_id]).to be_nil
    end

    it "sets flash message" do 
      expect(flash[:warning]).not_to be_blank
    end

    it "redirects to root path" do 
      expect(response).to redirect_to root_path
    end
  end
end
