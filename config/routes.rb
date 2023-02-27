Rails.application.routes.draw do
  get "/identifiers/id/:id_type", to: "conclave_identifiers#index"
  get "/identifiers/organisation/:id", to: "conclave_identifiers#extra_work"

  namespace :testing do
    get "/db_get", to: "testing#return_single_entry"
  end
end
