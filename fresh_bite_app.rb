require 'sinatra'
require 'active_record'
require 'mysql2'
require 'dotenv/load' # Optional for .env file
require 'sinatra/namespace'

# Explicitly establishing ActiveRecord connection with SSL disabled
ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: 'mysql-freshbite-munendra0412-3e77.c.aivencloud.com',
  port: '27005',
  database: 'freshbite',
  username: 'munendra',
  password: 'AVNS_AtTD6atRjgWRyaDKs7q',
  ssl_mode: 'DISABLED'  # Directly disable SSL
)

# Example Model
class User < ActiveRecord::Base
end

helpers = Dir.glob("helpers/*.rb")
helpers = helpers.flatten.uniq
helpers.each do |helper|
  require_relative "#{helper}"
end

routes = Dir.glob("routes/*.rb")
routes = routes.flatten.uniq
routes.each do |route|
  require_relative "#{route}"
end

class FreshBiteApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  register Sinatra::Namespace
  
  set :public_folder, 'views' # Serve static files from the views folder

  get '/' do
    send_file File.join(settings.public_folder, 'index.html')
  end
  namespace "/api" do
    get "/" do
      "Hello world!, Welcome to RetailerAppStg API. This is V1 Application."
    end

    # Test MySQL connection
    get '/test_connection' do
      # begin
        # Check if ActiveRecord connection is active
        if ActiveRecord::Base.connection.active?
          "MySQL connection is successful!"
        else
          "MySQL connection is not active!"
        end
      # rescue => e
      #   "MySQL connection failed: #{e.message}"
      # end
    end

    namespace "/index" do
      register Sinatra::RetailerApp::Routing::SampleRoutes
    end
  end
end
