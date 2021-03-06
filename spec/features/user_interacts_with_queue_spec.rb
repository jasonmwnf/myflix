require 'spec_helper'

feature "User interacts with the queue" do
  scenario "user adds and reorders videos in the queue" do 
    cat1 = Fabricate(:category, name: "comedies")
    monk = Fabricate(:video, title: "Monk", category: cat1)
    south_park = Fabricate(:video, title: "South Park", category: cat1)
    futurama = Fabricate(:video, title: "Futurama", category: cat1)

    sign_in
    
    add_video_to_queue(monk)
    expect(page).to have_content monk.title

    visit video_path(monk)
    expect(page).not_to have_content "+ My Queue"

    add_video_to_queue(south_park)
    add_video_to_queue(futurama)

    set_video_position(monk, 3)
    set_video_position(south_park, 1)
    set_video_position(futurama, 2)

    click_button "Update Instant Queue"

    expect_video_position(south_park, 1)
    expect_video_position(futurama, 2)
    expect_video_position(monk, 3)
  
  end

  def add_video_to_queue(video)
    visit home_path
    click_on_video_on_homepage(video)
    click_link "+ My Queue"
  end

  def set_video_position(video, position)
    within(:xpath, "//tr[contains(.,'#{video.title}')]") do 
      fill_in "queue_items[][position]", with: position
    end
  end

  def expect_video_position(video, position)
    expect(find(:xpath, "//tr[contains(.,'#{video.title}')]//input[@type='text']").value).to eq(position.to_s)
  end
end