Rails.application.routes.draw do
  get 'posts/index'
   get 'posts/index' 
  #リクエストメソッド 'リクエストURL', (to: 'コントローラー名#アクション名')←（）は省略可能？
  
  resources :posts 
  #resourcesメソッドを使うことでCRUD処理に必要なルーティングをまとめて定義をすることができます。
  #index show new edit create update destroy
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
