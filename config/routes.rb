SecretMessageSystem::Application.routes.draw do
  # Website Entry Point
  root 'main#index'

  # All api routes should be scoped
  scope :api do
    # Resource Routes
    resources :messages, :only => [:index, :create, :show, :destroy, :update]

    # Login and Register
    post 'register' => 'users#register'
    post 'login' => 'users#login'

    # Call Routes
    get 'handle' => 'call#handle_call'
    post 'play' => 'call#play_message'
    post 'end' => 'call#end_call'
  end

  # Wildcard route to direct handling to entry point.
  # This allows the angular router to handle it in the case of bookmarking or a page refresh.
  get '*otherwise' => 'main#index'
end
