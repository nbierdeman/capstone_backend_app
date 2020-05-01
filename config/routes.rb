Rails.application.routes.draw do
  namespace :api do
    get "/trips" => "trips#index"
    get "/trips/:id" => "trips#show"
  end
end
