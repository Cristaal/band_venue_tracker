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
