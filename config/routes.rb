BdnsHosts::Application.routes.draw do

  root to: 'hosts#home'
  get '/hosts/vote' => 'hosts#voting_booth', as: 'voting_booth' 
  post '/hosts/vote/:id' => 'hosts#vote', as: 'vote'
end
