Obtvse::Application.routes.draw do
  resources :posts
  match '/admin', :to => 'posts#admin'
  match '/new', :to => 'posts#new'
  match '/edit/:id', :to => 'posts#edit'
  post '/:slug/kudos', :to => 'posts#kudos', :as => 'post'
  post '/preview', :to => 'posts#preview'
  put '/preview', :to => 'posts#preview'
  match "mu-0ee6831b-17e743aa-f068c19f-5f1e3a36" => "blitz#d42"
  get '/:slug', :to => 'posts#show', :as => 'post'
  delete '/:slug', :to => 'posts#destroy', :as  => 'post'
  put '/:slug', :to => 'posts#update', :as  => 'post'

  root :to => 'posts#index'
end
