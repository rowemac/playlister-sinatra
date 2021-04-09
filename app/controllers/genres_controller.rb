class GenresController < ApplicationController
    get '/genres' do
        @genres = Genre.all
        erb :'/genres/index'
    end 
    
    get '/genres/new' do 
        erb :'/genres/new'
    end
    
    post '/genres' do 
        @genre = Genre.create(params)
        redirect "/genres/#{@genre.slug}"
    end
    
    get '/genres/:slug' do 
        @genre = Genre.find_by_slug(params[:slug])
        erb :'/genres/show'
    end 
    
    get '/genres/:slug/edit' do 
        @genre = Genre.find_by_slug(params[:slug])
        erb :'/genres/edit'
    end 
    
    patch '/genres/:slug' do 
        @genre = Genre.find_by_slug(params[:slug])
        @genre.update(params)
        redirect to "/genres/#{@genre.slug}"
    end
end