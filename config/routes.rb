Rails.application.routes.draw do
  resources :stock_items, :path => "stock_items" do
    collection do
      get "/remove_product"  => "stock_items#remove_product", :as => "remove_product"
      get "/show_remove"  => "stock_items#show_remove", :as => "show_remove"
    end
  end  
  resources :stores, :path => "stores" do
    collection do
      get "/show_stock"  => "stores#show_stock", :as => "show_stock"
    end
  end
  resources :products
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
