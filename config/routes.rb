Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#Answers Routes
get '/' => 'answers#index'
get '/answers' => 'answers#index'
get '/answers/new' => 'answers#new'
post '/answers' => 'answers#create'
get '/answers' => 'answers#show'
get '/answers/:id/edit' => 'answers#edit'
get '/answers/:id' => 'answers#update'
delete '/answers/:id' => 'answers#destroy'

#Availabilities Routes
get '/' => 'availabilities#index'
get '/availabilities' => 'availabilities#index'
get '/availabilities/new' => 'availabilities#new'
post '/availabilities' => 'availabilities#create'
get '/availabilities' => 'availabilities#show'
get '/availabilities/:id/edit' => 'availabilities#edit'
get '/availabilities/:id' => 'availabilities#update'
delete '/availabilities/:id' => 'availabilities#destroy'

#Budget Routes
get '/' => 'budgets#index'
get '/budgets' => 'budgets#index'
get '/budgets/new' => 'budgets#new'
post '/budgets' => 'budgets#create'
get '/budgets' => 'budgets#show'
get '/budgets/:id/edit' => 'budgets#edit'
get '/budgets/:id' => 'budgets#update'
delete '/budgets/:id' => 'budgets#destroy'

#Location Routes
get '/' => 'locations#index'
get '/locations' => 'locations#index'
get '/locations/new' => 'locations#new'
post '/locations' => 'locations#create'
get '/locations' => 'locations#show'
get '/locations/:id/edit' => 'locations#edit'
get '/locations/:id' => 'locations#update'
delete '/locations/:id' => 'locations#destroy'

#Location_Preferences Routes
get '/location_preferences' => 'location_preferences#index'
post '/location_preferences' => 'location_preferences#create'
delete '/location_preferences/:id' => 'location_preferences#destroy'

#Matches
get '/' => 'matches#index'
get '/matches' => 'matches#index'
get '/matches/new' => 'matches#new'
post '/matches' => 'matches#create'
get '/matches' => 'matches#show'
get '/matches/:id/edit' => 'matches#edit'
get '/matches/:id' => 'matches#update'
delete '/matches/:id' => 'matches#destroy'

#Questions Routes
get '/' => 'questions#index'
get '/questions' => 'questions#index'
get '/questions/new' => 'questions#new'
post '/questions' => 'questions#create'
get '/questions' => 'questions#show'
get '/questions/:id/edit' => 'questions#edit'
get '/questions/:id' => 'questions#update'
delete '/questions/:id' => 'questions#destroy'

#Users Routes
get '/signup' => 'users#new'
post '/users' => 'users#create'

#User_Answers Routes
get '/' => 'user_answers#index'
get '/user_answers' => 'user_answers#index'
get '/user_answers/new' => 'user_answers#new'
post '/user_answers' => 'user_answers#create'
get '/user_answers' => 'user_answers#show'
get '/user_answers/:id/edit' => 'user_answers#edit'
get '/user_answers/:id' => 'user_answers#update'
delete '/user_answers/:id' => 'user_answers#destroy'

end
