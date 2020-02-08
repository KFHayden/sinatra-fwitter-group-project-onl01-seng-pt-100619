require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    erb :index
  end
  
  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect to '/tweets'
    end
    
    erb :'/users/create_user'
  end
  
  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect to 'signup'
    end
    
    user = User.new(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to '/tweets'
  end
  
  get '/tweets' do

  end

end