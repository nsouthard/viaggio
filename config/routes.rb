Rails.application.routes.draw do
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#Answers Routes
get '/answers' => 'answers#index'
get '/answers/new' => 'answers#new'
post '/answers' => 'answers#create'
get '/answers' => 'answers#show'
get '/answers/:id/edit' => 'answers#edit'
patch '/answers/:id' => 'answers#update'
delete '/answers/:id' => 'answers#destroy'

#Availabilities Routes
get '/availabilities' => 'availabilities#index'
get '/availabilities/new' => 'availabilities#new'
post '/availabilities' => 'availabilities#create'
get '/availabilities' => 'availabilities#show'
get '/availabilities/:id/edit' => 'availabilities#edit'
patch '/availabilities/:id' => 'availabilities#update'
delete '/availabilities/:id' => 'availabilities#destroy'

#Budget Routes
get '/budgets' => 'budgets#index'
get '/budgets/new' => 'budgets#new'
post '/budgets' => 'budgets#create'
get '/budgets' => 'budgets#show'
get '/budgets/:id/edit' => 'budgets#edit'
patch '/budgets/:id' => 'budgets#update'
delete '/budgets/:id' => 'budgets#destroy'

#Location Routes
get '/locations' => 'locations#index'
get '/locations/new' => 'locations#new'
post '/locations' => 'locations#create'
get '/locations' => 'locations#show'
get '/locations/:id/edit' => 'locations#edit'
patch '/locations/:id' => 'locations#update'
delete '/locations/:id' => 'locations#destroy'

#Location_Preferences Routes
get '/location_preferences' => 'location_preferences#index'
get '/location_preferences/new' => 'location_preferences#new'
post '/location_preferences' => 'location_preferences#create'
get '/location_preferences' => 'location_preferences#show'
get '/location_preferences/:id/edit' => 'location_preferences#edit'
patch '/location_preferences/:id' => 'location_preferences#update'
delete '/location_preferences/:id' => 'location_preferences#destroy'

#Matches
get '/matches' => 'matches#index'
get '/matches/new' => 'matches#new'
post '/matches' => 'matches#create'
get '/matches' => 'matches#show'
get '/matches/:id/edit' => 'matches#edit'
patch '/matches/:id' => 'matches#update'
delete '/matches/:id' => 'matches#destroy'

#Questions Routes
get '/questions' => 'questions#index'
get '/questions/new' => 'questions#new'
post '/questions' => 'questions#create'
get '/questions' => 'questions#show'
get '/questions/:id/edit' => 'questions#edit'
patch '/questions/:id' => 'questions#update'
delete '/questions/:id' => 'questions#destroy'

# session routes
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

#Users Routes
get '/' => 'users#index'
get '/users' => 'users#index'
get '/signup' => 'users#new'
post '/users' => 'users#create'
get '/users/:id' => 'users#show'
get '/users/:id/edit' => 'users#edit'
patch '/users/:id' => 'users#update'

#User_Answers Routes
get '/user_answers' => 'user_answers#index'
get '/user_answers/new' => 'user_answers#new'
post '/user_answers' => 'user_answers#create'
get '/user_answers' => 'user_answers#show'
get '/user_answers/:id/edit' => 'user_answers#edit'
patch '/user_answers/:id' => 'user_answers#update'
delete '/user_answers/:id' => 'user_answers#destroy'

end
