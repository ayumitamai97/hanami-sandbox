# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/

get '/', to: 'home#index'
resources :attendances, only: %i[new create index edit update]
