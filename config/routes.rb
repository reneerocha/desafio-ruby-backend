Rails.application.routes.draw do
  root to: "transactions#index"
  resources :transactions do
  resources :file_uploads, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
