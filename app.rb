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
    user_info = @user_database.all.detect { |user_hash| user_hash[:username] == hash[:username] && user_hash[:password] == hash[:password] }
    session[:user_id] = user_info[:id]
    flash[:notice] = "Welcome, #{user_info[:username]}."
    redirect "/"
  end

  get "/log_out" do
    session.delete(:user_id)
    redirect "/"
  end
end
