require('spec_helper')

 describe(Venue) do
   it { should have_and_belong_to_many (:bands) }
   it("validates the presence of name") do
     venue = Venue.new({:name => ''})
     expect(venue.save()).to(eq(false))
   end

   it ("will capitalize the name of the venue") do
     venue = Venue.create({:name => "the fillmore"})
     expect(venue.name()).to(eq("The Fillmore"))
   end
end
