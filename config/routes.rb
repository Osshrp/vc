Rails.application.routes.draw do
  resources :feedbacks
  root :to => "feedbacks#index"
end
