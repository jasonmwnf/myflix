require 'spec_helper'

feature "user signs in" do 
  scenario "with valid email and password" do 
    alice = Fabricate(:user)
    sign_in(alice)
    expect(page).to have_content alice.username
  end

  scenario "with deactivated user" do 
    alice = Fabricate(:user, active: false)
    sign_in(alice)
    expect(page).not_to have_content alice.username
    expect(page).to have_content("Your account has been suspended, please contact customer service.")
  end
end