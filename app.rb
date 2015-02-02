require("bundler/setup")
require("pry")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get('/bands') do
  @bands = Band.all
  erb(:bands)
end

post('/bands') do
  name = params.fetch("band")
  Band.create({:name => name})
  @bands = Band.all()
  erb(:bands)
end

get('/venues') do
  @venues = Venue.all
  erb(:venues)
end

post('/venues') do
  name = params.fetch("venue")
  Venue.create({:name => name})
  @venues = Venue.all()
  erb(:venues)
end

get("/bands/:id") do
  @venues = Venue.all()
  @band = Band.find(params.fetch("id").to_i())
  erb(:band_page)
end

get("/venues/:id") do
  @venue = Venue.find(params.fetch("id").to_i())
  erb(:venue_page)
end

patch("/bands/:id") do
  @band = Band.find(params.fetch("id").to_i())
  params["venue_id"].each do |id|
    venue = Venue.find(id.to_i())
    @band.venues << venue
  end
  @venues = Venue.all()
  erb(:band_page)
end

patch("/venues/:id") do
  @venue = Venue.find(params.feth("id").to_i())
  params["band_id"].each do |id|
    band = Band.find(id.to_i())
    @venue.bands << band
  end
  @bands = Band.all()
  erb(:venue_page)
end
