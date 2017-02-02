Rails.application.routes.draw do
  resources :feedbacks
  root :to => "feedbacks#index"
  resources :photos do
    post 'image', is_array: true
  end
end
