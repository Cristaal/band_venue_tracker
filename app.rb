require("bundler/setup")
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

patch("/bands/:id") do
  band_id = params.fetch("id").to_i()
  @venue = Venue.find(params.fetch("id").to_i())
  @band = Band.find(params.fetch("id").to_i())
  @band.update({:venue_id => venue_id})
  @venues = Venue.all()
  erb(:band_page)
end
