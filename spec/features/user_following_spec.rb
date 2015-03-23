require 'spec_helper'

feature 'User following' do 
  scenario "user follows and unfollows someone" do 
    
    alice = Fabricate(:user)
    category = Fabricate(:category, name: "Drama")
    video = Fabricate(:video, category: category)
    Fabricate(:review, user: alice, video: video)
    
    sign_in
    click_on_video_on_homepage(video)

    click_link alice.username
    click_link "Follow"
    expect(page).to have_content(alice.username)

    unfollow(alice)
    expect(page).not_to have_content(alice.username)
  end

  def unfollow(user)
    find("a[data-method='delete']").click
  end
end