RakeControlWeb::Engine.routes.draw do
  resources :tasks, path: '/', only: [:index], constraints: { id: /[a-z0-9_:]+/ } do
    member{ get :run }
    resources :runs, only: [:index, :show]
  end
end
