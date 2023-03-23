Rails.application.routes.draw do
  namespace 'identifiers' do
    namespace 'id' do
      match '/ppon', to: 'organisations#create', via: [:post]
    end
  end
  post '*unmatched_route', to: 'application#not_found'
end