require 'spec_helper'

describe Admin::VideosController do 
  describe "GET new" do 
    # it_behaves_like "requires sign in" do 
    #   let(:action) { get :new }
    # end

    it_behaves_like "requires admin" do 
      let(:action) { get :new }
    end
    it "sets the @video to a new video" do 
      set_current_admin
      get :new
      expect(assigns(:video)).to be_instance_of Video
      expect(assigns(:video)).to be_new_record
    end

    it "sets the flash error message for regular user" do 
      set_current_user
      get :new
      expect(flash[:danger]).to be_present
    end
  end

  describe "POST create" do 
    # it_behaves_like "requires sign in" do 
    #   let(:action) { post :create }
    # end

    it_behaves_like "requires admin" do 
      let(:action) { post :create }
    end

    context "with valid input" do 
      let(:tv_shows) { Fabricate(:category) }
      before do
        set_current_admin
        post :create, video: {
          title: "Futurama",
          description: "funny show",
          category_id: tv_shows.id
        }
      end

      it "redirects to new admin video" do
        expect(response).to redirect_to new_admin_video_url
      end

      it "creates the video" do
        expect(tv_shows.videos.count).to eq(1)
      end


      it "sets the flash success message" do 
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid input" do 
      let(:tv_shows) { Fabricate(:category) }
      before do
        set_current_admin
        post :create, video: {
          description: "funny",
          category_id: tv_shows.id
        }
      end

      it "does not create a video" do 
        expect(tv_shows.videos.count).to eq(0)
      end

      it "render the :new template" do 
        expect(response).to render_template :new
      end

      it "sets the @video variable" do 
        expect(assigns(:video)).to be_present
      end

      it "sets the flash error message" do 
        expect(flash[:danger]).to be_present
      end
    end
  end
end