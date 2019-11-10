require('sinatra')
require('sinatra/contrib/all')

require('pry-byebug')

require_relative( '../models/trainer.rb' )
require_relative ('../models/match.rb')

also_reload( '../models/*' )

get '/trainers' do
  @trainers = Trainer.all()
  erb (:"trainers/index")
end

get '/trainers/new' do
  @trainers = Trainer.all()
  erb (:"trainers/new")
end

post '/trainers' do
  trainer = Trainer.new(params)
  trainer.save()
  redirect to ("/trainers")
end

get '/trainers/:id' do
  @trainers = Trainer.find(params['id'].to_i)
  erb(:"trainers/show")
end
#
# get '/trainers' do
#   @trainer = Trainer.new(params)
#   @trainer.save
#   erb(:"/trainers/create")
# end
#
# get '/trainers/:id/edit' do
#   @matches = Match.all
#   @trainer = trainer.find(params['id'])
# end
#
# post '/trainers/:id' do
#   trainer = Trainer.new(params)
#   trainer.update
#   redirect to '/trainers/#{params[id]}'
# end
#
# post '/trainers/:id/delete' do
#   trainer = Trainer.find(params[:id])
#   trainer.delete()
#   redirect to '/trainers'
# end
