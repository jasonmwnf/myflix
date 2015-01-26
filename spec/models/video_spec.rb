require 'spec_helper'

describe Video do 
  it "saves itself" do 
    video = Video.new(title: "Archer", description: "Funniest show on tv.")
    video.save 
    expect(Video.first).to eq(video)
  end
end