require "sinatra"
require "rack-flash"

require "./lib/user_database"

class App < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @user_database = UserDatabase.new
  end

  get "/" do
    erb :home
  end

  get "/new" do
    erb :new
  end

  post "/new_user" do
    hash = { username: params[:username], password: params[:password] }
    @user_database.insert(hash)
    flash[:notice] = "Thank you for registering."
    redirect "/"
  end
end
