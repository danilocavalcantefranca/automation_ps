require "pry"
require "rspec"
require 'httparty'
require 'yaml'
require 'mongo'
require 'byebug'
require 'faker'
require 'oci8'
require 'json-schema'
require_relative 'helpers.rb'
include Helpers

QUERIES =         YAML.load_file("features/support/db/mongo/queries.yml")
QUERIES_ORACLE =  YAML.load_file("features/support/db/oracle/queries.yml")
CONFIG_HOSTS =    YAML.load_file("config/hosts.yml")
PATHS =           YAML.load_file("config/paths.yml")
CONNECTIONS =     YAML.load_file("config/connections.yml")
HOSTS =           CONFIG_HOSTS[ENV['ENVIRONMENT'].downcase]

page = lambda {|klass| klass.new}

Before do
  @page = page
end