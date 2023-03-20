Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      match '/ppon', to: 'organisations#create', via: [:get]
    end
  end
end