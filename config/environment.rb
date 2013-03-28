# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'
require 'faker'
require 'sinatra'
require "sinatra/reloader" if development?
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require "mini_magick"
require 'carrierwave/processing/mini_magick'
require 'erb'
require 'bcrypt'
require 'fog'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Set up config file for CarrierWave
# CarrierWave.configure do |config|
#   config.permissions = 0666
#   config.directory_permissions = 0777
#   config.storage = :file
#   config.root = "#{APP_ROOT}/public"
#   config.store_dir = "images"
# end

if Sinatra::Application.development?
  s3_data = YAML.load_file(APP_ROOT.join('config', 's3.yml'))
  ENV['S3_ACCESS_KEY_ID'] = s3_data['s3_access_key_id']
  ENV["S3_SECRET_ACCESS_KEY"] = s3_data['s3_secret_access_key']
end

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_directory = "GorillaMonkey"

  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => ENV["S3_ACCESS_KEY_ID"],
    :aws_secret_access_key => ENV["S3_SECRET_ACCESS_KEY"]
  }
end




















