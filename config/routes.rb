Rails.application.routes.draw do
  resources :developments do
    resources :dwellings
    member do
      get :completion_form
      patch :completion
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
