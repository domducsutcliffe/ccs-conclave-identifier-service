Rails.application.routes.draw do
  namespace 'identifiers' do
    match '/ppon', to: 'organisations#create', via: [:post]
  end
  post '*unmatched_route', to: 'application#not_found'
end