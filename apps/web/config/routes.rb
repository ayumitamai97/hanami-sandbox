# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/', to: 'home#index'
resources :attendances, only: %i[new create index]
post '/attendances', to: 'attendances#create'
get '/attendances', to: 'attendances#index'
