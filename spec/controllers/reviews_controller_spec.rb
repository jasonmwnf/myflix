require 'spec_helper'

describe ReviewsController do
  describe "POST create" do 
    let(:video) { Fabricate(:video) }
    context "with authenticated users" do 
      let(:current_user) { Fabricate(:user) }
      before { session[:user_id] = current_user.id }

      context "with vaild inputs" do 
        before do 
          post :create, review: Fabricate.attributes_for(:review), video_id: video.id
        end

        it "redirects to the video show page" do 
          #video = Fabricate(:video) - all being replace by the "let(:video)" above
          #post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          #^ being replaced by the 'before do' above
          expect(response).to redirect_to video
        end

        it "creates a review" do 
          #video = Fabricate(:video)
          #post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          expect(Review.count).to eq(1)
        end
        it "creates a review associated with the video" do 
          #video = Fabricate(:video)
          #post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          expect(Review.first.video).to eq(video)
        end
        it "creates a review associated with the signed in user" do 
          #video = Fabricate(:video)
          #post :create, review: Fabricate.attributes_for(:review), video_id: video.id
          expect(Review.first.user).to eq(current_user)
        end
      end

      context "with invalid inputs" do 
        it "does not create a reivew" do 
          #video = Fabricate(:video)
          post :create, review: {rating: 4}, video_id: video.id
          expect(Review.count).to eq(0)
        end

        it "renders the videos/show template" do 
          #video = Fabricate(:video)
          post :create, review: {rating: 4}, video_id: video.id
          expect(response).to render_template 'videos/show'
        end

        it "sets @video" do 
          #video = Fabricate(:video)
          post :create, review: {rating: 4}, video_id: video.id
          expect(assigns(:video)).to eq(video)
        end

        it "sets @reviews" do 
          #video = Fabricate(:video)
          review = Fabricate(:review, video: video)
          #can't extract all the 'post :create's to a before do under this
          #context because this 'it' needs to run 'review' first.
          post :create, review: {rating: 4}, video_id: video.id
          expect(assigns(:reviews)).to match_array([review])
        end
      end
    end
    context "with unauthenticated users" do 
      it "redirects to sign in path" do 
        #video = Fabricate(:video)
        post :create, review: Fabricate.attributes_for(:review), video_id: video.id
        expect(response).to redirect_to sign_in_path
      end
    end
  end
end