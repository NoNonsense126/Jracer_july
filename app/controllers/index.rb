get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/games' do
  player_one = Player.find_or_initialize_by(name: params[:players][:one])
  player_two = Player.find_or_initialize_by(name: params[:players][:two])

  unless player_two.save && player_one.save
    redirect to "/"
  else
    game = Game.new
    game.player1_id = player_one.id
    game.player2_id = player_two.id
    if game.save
      redirect to "/games/#{game.id}"
    else
      redirect to "/"
    end
  end
end

get '/games/:id' do
  @game = Game.find(params[:id])
  erb :"games/show"
end