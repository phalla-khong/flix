Flix::Application.routes.draw do
  #resources :reviews

  root "movies#index"
  #resources :movies
  resources :movies do
	  resources :reviews
	end
end
