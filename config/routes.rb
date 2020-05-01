Rails.application.routes.draw do
  namespace :api do
    get "/trips" => "trips#index"
  end
end
