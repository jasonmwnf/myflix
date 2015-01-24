require 'spec_helper'

describe Video do 
  it "saves itself" do 
    video = Video.new(title: "Archer", description: "Funniest show on tv.")
    video.save 
    Video.first.title.should == "Archer"
  end
end