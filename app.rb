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

  post "/log_in" do
    hash = { username: params[:username], password: params[:password] }
    user_hash = @user_database.all.detect { |userhash| userhash[:username] == hash[:username] && userhash[:password] == hash[:password] }
    session[:id] = user_hash[:id]
    flash[:notice] = "Welcome, #{user_hash[:username]}."
    redirect "/"
  end
end
