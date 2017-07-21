Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'admin/dashboard#index'
  resources :messages, only: :index
  namespace :admin, path: 'admin' do
    root 'dashboard#index'
    get '/', to: redirect('/dashboard')
    resources :dashboard, only: [:index]
    resources :messages
    post '/', to: 'dashboard#create'
    get '/auto', to: 'dashboard#auto'
    resources :photo_attrs
  end
end

Rails.application.routes.named_routes.tap do |routes|
  routes.add(:admin_root, routes.get(:admin_dashboard_index))
end
