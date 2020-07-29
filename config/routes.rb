# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    scope '/1.0' do
      devise_for :users, 
        controllers: {
          registrations: :registrations,
          sessions: :sessions,
          passwords: :passwords
        },
        path: '',
        path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup' }
      resources :complaints, except: [:new]
      match '/me', to: 'profile#show', via: :get
      match '/me', to: 'profile#update', via: :put
    end
  end
end
