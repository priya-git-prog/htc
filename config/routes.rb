Rails.application.routes.draw do
  root to: 'companies#index'
  
  resources :companies do
    member do
      get :company_ticket
    end
    collection do
      post '/generate_bill' => 'companies#generate_bill', :as => 'generate_bill'
    end
  end
  # map.resources :companies, :collection => { :generate_bill => :post }

  resources :tickets 
  # do
  #   member do
  #     get :generate_bill
  #   end
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
