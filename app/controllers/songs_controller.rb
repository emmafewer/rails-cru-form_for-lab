class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end 

    def edit
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.create(name: params[:song][:name], artist_id: params[:song][:artist_id], genre_id: params[:song][:genre_id])
        @song.save(song_params)
        redirect_to @song
    end

    def show
        @song = Song.find(params[:id])
    end 

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        redirect_to @song
    end

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end
end
