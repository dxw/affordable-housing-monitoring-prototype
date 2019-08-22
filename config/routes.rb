Rails.application.routes.draw do
  resources :developments do
    resources :dwellings
    member do
      get :completion_form
      patch :completion
    end
  end
  get '/public_dashboard', to: 'public_dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
