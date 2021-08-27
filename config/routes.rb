Rails.application.routes.draw do
  resources :projects, only: [:new, :show, :create, :edit, :destroy]
  post '/move', to: 'game#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
