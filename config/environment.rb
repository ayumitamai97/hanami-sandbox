require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/kintai'
require_relative '../apps/web/application'
require_relative '../apps/admin/application'

Hanami.configure do
  mount Admin::Application, at: '/admin'
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/kintai_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/kintai_development'
    #    adapter :sql, 'mysql://localhost/kintai_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/kintai/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    require 'pry'
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :test do
    require 'pry'
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    # mailer do
    #   delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    # end
  end
end
