require 'spec_helper'

describe Category do 
  it "saves itself" do
    cat = Category.new(name: "Documentaries")
    cat.save 
    expect(Category.first).to eq(cat)
  end

  it "has many videos" do
    cat = Category.create(name: "comedies")
    archer = Video.create(title: "Archer", description: "Funniest show on tv.", category: cat)
    simpsons = Video.create(title: "Simpsons", description: "Doh!", category: cat)
    expect(cat.videos).to eq([archer, simpsons])
  end
end