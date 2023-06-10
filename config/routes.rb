Rails.application.routes.draw do
  root "courses#index"
  resources :courses, only: [:create, :index] do
    resources :tutors, only: [:create]
  end
end
