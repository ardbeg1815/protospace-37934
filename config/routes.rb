Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index" #views/prototypes/index.html.erbを呼び出す
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do #prototypesコントローラーにアクションを定義
    resources :comments, onry: :create
  end
  resources :users, only: :show
end
