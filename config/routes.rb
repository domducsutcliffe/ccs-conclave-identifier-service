Rails.application.routes.draw do
  get "/identifiers/id/:id_type", to: "conclave_identifiers#index"

  namespace :testing do
    get "/db_get", to: "testing#return_single_entry"
  end
end
