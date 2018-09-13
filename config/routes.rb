Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :index]
  resources :staffs, only: [:new, :create, :edit, :index] do
    collection do
      post :confirm
      #post :update
    end
  end
  post "/staffs/new" => "staffs#create"
  resources :stocks, only: [:new, :create, :index, :update, :edit] do
    collection do
      post :confirm
    end
  end
  get '/return_list',  to: 'stocks#return_list'
  get 'return_procedure/:id', to: 'stocks#return_procedure'
  get '/aggregate', to: 'stocks#aggregate'
  get '/stock_list', to: 'stocks#stock_list'
end
