class AlbumsController < ApplicationController

    def new
        # debugger
        @album = Album.new

        render :new
    end

    def create
        @album = Album.new(album_params)
         # @album.band_id = params[:band_id]
        # debugger 

        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = ['Not Valid']
            render :new        
        end
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end


    private

    def album_params
        params.require(:album).permit(:title, :year, :band_id, :live?)
    end
end
