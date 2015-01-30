require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @venues = Venue.all()
  erb(:index)
end

post("/venues") do
  name = params.fetch("venue")
  Venue.create({:name => name})
  @venues = Venue.all()
  erb(:index)
end
