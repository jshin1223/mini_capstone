Rails.application.routes.draw do
  namespace :api do
    get '/first_product_url' => 'products#first_product_action'
  end 
end 

