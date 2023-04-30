Rails.application.routes.draw do
  root to: "home#index"
  
  resources :sale_files, except: %i[ destroy ]


end
