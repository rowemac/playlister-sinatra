class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end 
    
    get '/songs/new' do 
        erb :'/songs/new'
    end
    
    post '/songs' do
        @song = Song.create(name: params[:song_name])
        @song.artist = Artist.find_or_create_by(name: params[:artist_name])
        params[:genres].each do | genre_id |
            SongGenre.new(song_id: @song.id, genre_id: genre_id)
        end
        flash[:message] = "Successfully created song."
        redirect to "/songs/:slug"
    end
    
    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end 
    
    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end 
    
    patch '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        @song.update(params)
        flash[:message] = "Successfully created song."
        redirect to "/songs/:slug"
    end
    

    



end