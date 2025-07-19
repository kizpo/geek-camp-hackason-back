Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/', to: proc { [200, {}, ['OK']] }

  # Defines the root path route ("/")
  # root "posts#index"
  
  namespace :api do
    namespace :v1 do
      resources :streamers, :viewers, :comments, :streams, :follows
      post 'auth/streamer_login', to: 'auth#streamer_login'
      post 'auth/viewer_login', to: 'auth#viewer_login'
      get 'get_selected_streamers_stream', to: 'streams#get_selected_streamers_stream'
    end
  end
end
