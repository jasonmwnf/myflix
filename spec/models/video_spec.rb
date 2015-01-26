require 'spec_helper'

describe Video do 
  it "saves itself" do 
    video = Video.new(title: "Archer", description: "Funniest show on tv.")
    video.save 
    expect(Video.first).to eq(video)
  end

  it "belongs to category" do 
    cat = Category.create(name: "Comedies")
    video = Video.create(title: "Archer", description: "Funny.", category: cat)
    expect(video.category).to eq(cat)
  end
end