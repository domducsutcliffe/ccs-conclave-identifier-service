Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      match '/organisations', to: 'organisations#create', via: [:post]
    end
  end
  post '*unmatched_route', to: 'application#not_found'
end