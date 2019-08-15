Rails.application.routes.draw do
  resources :developments do
    resources :dwellings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
