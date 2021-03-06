# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

# NOTICE: namespace '/admin'
get '/', to: 'home#index'
get '/users', to: 'users#index'
resources :attendances, only: %i[index update]
