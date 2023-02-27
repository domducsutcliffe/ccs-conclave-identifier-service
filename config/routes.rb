Rails.application.routes.draw do
  get "/identifiers/id/:id_type", to: "ppon_identifier#index"

  namespace :testing do
    get "/ppon_get_first", to: "testing#return_first_ppon_id"
    get "/ppon_get/:index", to: "testing#return_specific_ppon_id"
  end
end
