# frozen_string_literal: true

Rails.application.routes.draw do
  root "users#index"
  resources :users, :except => [:new, :edit, :destroy]
end
