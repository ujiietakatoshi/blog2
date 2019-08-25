Rails.application.routes.draw do
  devise_for :users
  root'blog2#index'             #ルートパスの指定
  get 'blog2' => 'blog2#index'
  get 'blog2/new'  =>  'blog2#new'  #投稿画面
  post'blog2'      =>  'blog2#create'    #ツイート投稿機能
  delete  'blog2/:id'  => 'blog2#destroy'
  patch   'blog2/:id'  => 'blog2#update'
  get   'blog2/:id/edit'  => 'blog2#edit'
  get   'users/:id'   =>  'users#show'    #Mypageへのルーティング
end
