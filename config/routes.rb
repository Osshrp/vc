Rails.application.routes.draw do
  resources :feedbacks, defaults: { format: :json }
  root :to => "feedbacks#index", defaults: { format: :json }
end
