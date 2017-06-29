require_relative '../../config/environment'
require_relative '../models/post.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #   erb :index
  # end!

  # New Form
  get '/posts/new' do
    erb :new
  end

  # Create
  post '/posts' do
    # binding.pry
    @post = Post.create(params[:post])
    erb :new_post_index
  end

  ## Read methods

  # Index method
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    # binding.pry
    @post = Post.all.find{|post| post.id == params[:id].to_i}
    erb :show
  end

  get '/posts/:id/edit' do
    # binding.pry
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    # binding.pry
    @post = Post.find_by(id: params[:id])
    @post.update(params[:post])
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post.delete
    erb :post_deleted
  end



end
