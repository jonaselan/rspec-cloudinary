Rails.application.routes.draw do

  root 'contacts#index'
  resources :contacts, :only => [:index, :new, :create, :show, :destroy]
end
