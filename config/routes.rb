Rails.application.routes.draw do
  namespace :api do
    get "/trips" => "trips#index"
    post "/trips" => "trips#create"
    get "/trips/:id" => "trips#show"
    patch "/trips/:id" => "trips#update"
    delete "/trips/:id" => "trips#destroy"

    get "/trip_coordinates" => "trip_coordinates#index"
    post "/trip_coordinates" => "trip_coordinates#create"
    get "/trip_coordinates/:id" => "trip_coordinates#show"
    patch "/trip_coordinates/:id" => "trip_coordinates#update"
  end
end
