ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if params[:password] == params[:password_confirmation]
      redirect to('/links')
    else
      flash[:error] = 'Password and confirmation password do not match'
      redirect to('/users/new')
    end
  end

  get '/links' do # The path / url.
    @links = Link.all # Set instance variable to Link all.
    erb :'/links/links' # Reference the file.
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/links'
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

  end


end
