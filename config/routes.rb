# frozen_string_literal: true

Rails.application.routes.draw do
  root "users#index"
  resources :users, :except => [:edit, :update, :destroy]
  #get 'users' => 'users#index'
  #get 'users/new' => 'users#new'
  #post 'users' => 'users#create'
  #get 'users/edit'
  #put 'users/update'
  #delete 'users/destroy'
  #get 'users/:id' => 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
