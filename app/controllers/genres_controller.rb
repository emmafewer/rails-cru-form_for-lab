class GenresController < ApplicationController
    
    def new
        @genre = Genre.new
    end 

    def edit
        @genre = Genre.find(params[:id])
    end

    def create
        @genre = Genre.create(name: params[:genre][:name])
        @genre.save(genre_params)
        redirect_to @genre
    end

    def show
        @genre = Genre.find(params[:id])
    end 

    def update
        @genre = Genre.find(params[:id])
        @genre.update(genre_params)
        redirect_to @genre
    end

    def genre_params
        params.require(:genre).permit(:name)
    end
end
