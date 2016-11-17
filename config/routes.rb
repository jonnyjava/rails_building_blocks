Rails.application.routes.draw do
  resources :dashboard, only: :index
  resources :users
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }
  root to: 'dashboard#index'

  match '/401' => 'errors#render_error_401', via: :all, as: 'error_401'
  match '/404' => 'errors#render_error_404', via: :all, as: 'error_404'
  match '/422' => 'errors#render_error_422', via: :all, as: 'error_422'
  match '/500' => 'errors#render_error_500', via: :all, as: 'error_500'
  match '*path', to: 'errors#error_404', via: :all
end
