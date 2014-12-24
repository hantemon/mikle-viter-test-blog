Rails.application.routes.draw do
  resources :posts

  root "posts#index"
  match '/help', to: 'posts#help', via: 'get'
  match '/about', to: 'posts#about', via: 'get'
  match '/contact', to: 'posts#contact', via: 'get'
  match '/search', to: 'posts#search', via: 'get'
end