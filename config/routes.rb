Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      match '/ppon', to: 'organisations#create', via: [:get]
    end
  end
  get '*unmatched_route', to: 'application#not_found'
end