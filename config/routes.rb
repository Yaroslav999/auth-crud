Rails.application.routes.draw do
  devise_for :users
  resources :departments
  resources :employees
  root to: "employees#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
