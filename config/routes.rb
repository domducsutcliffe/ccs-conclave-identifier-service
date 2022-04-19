Rails.application.routes.draw do
  post "/identifiers/id/conclave", to: "conclave_identifiers#index"

  namespace :testing do
    get "/db_get", to: "testing#return_single_entry"
  end
end
