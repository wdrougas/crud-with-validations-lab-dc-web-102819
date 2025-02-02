class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def edit
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(strong_song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def update
        @song = Song.find(params[:id])
       if @song.update(strong_song_params)
        redirect_to song_path(@song)
       else
        render :edit
       end
    end

    private

    def strong_song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

end
