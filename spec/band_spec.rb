require('spec_helper')

describe(Band) do
  it { should have_and_belong_to_many (:venues) }
  it("validates the presence of name") do
    band = Band.new({:name => ''})
    expect(band.save()).to(eq(false))
  end

  it("will capitalize the name of the band") do
    band = Band.create({:name => "the pixies"})
    expect(band.name()).to(eq("The Pixies"))
  end


end
