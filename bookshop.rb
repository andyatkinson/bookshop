# frozen_string_literal: true
require 'bundler/inline'

gemfile(true) do
  source 'https://rubygems.org'

  gem 'rails', '~> 7.1'
  gem 'pg'
end

require 'rails/all'
database = 'bookshop_development'

# Example from Composite Primary Keys for Author and Book
# https://guides.rubyonrails.org/association_basics.html

ENV['DATABASE_URL'] = "postgres://postgres:@localhost:5432/bookshop_development"
ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: database)
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Schema.define do
  create_table :authors, force: true do |t|
    t.text :first_name, null: false
    t.text :last_name, null: false
  end

  create_table :books, force: true do |t|
    t.text :title, null: false
    t.integer :author_id, null: false
  end
end

class App < Rails::Application
  config.root = __dir__
  config.consider_all_requests_local = true
  config.secret_key_base = 'i_am_a_secret'
  config.active_storage.service_configurations = { 'local' => { 'service' => 'Disk', 'root' => './storage' } }
  config.load_defaults 7.1
end

class Author < ActiveRecord::Base
  #self.primary_key = [:first_name, :last_name]
  has_many :books#, query_constraints: [:first_name, :last_name]
end

class Book < ActiveRecord::Base
  belongs_to :author#, query_constraints: [:author_first_name, :author_last_name]
end
