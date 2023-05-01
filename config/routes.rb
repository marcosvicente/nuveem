Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'  

  root to: "home#index"
  
  resources :sale_files, except: %i[ destroy ]
end
