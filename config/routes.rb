Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do 
    member do
      get :calculate_recipe
    end
    resources :food_intakes
    resources :activities
  end

  resources :activities do
    collection do
      get :all
    end
  end
end
