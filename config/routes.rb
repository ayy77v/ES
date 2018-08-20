Rails.application.routes.draw do
  devise_for :models
  devise_for :users

  devise_scope :user do
  get '/sign-in' => "devise/sessions#new", :as => :login
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #http://localhost:3000/users/sign_in

  root 'groups#index' #這行代表把 localhost:3000/groups 這個網址設成首頁
  resources :groups do

  resources :posts

    member do

  	get :test
  	get :quiz
  	


  end

 end


 resources :starts


 
end
