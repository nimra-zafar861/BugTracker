Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "log_in" ,to:'sessions#new',:as=>"log_in"
  get "sign_in" ,to:'users#new',:as=>"sign_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  root "sessions#new"
  resources:users
  resources:sessions
  resources:projects do 
    collection  do
      delete :"destroyUser"
    end
  end

    resources:bugs

 # Defines the root path route ("/")
  # root "articles#index"
end
