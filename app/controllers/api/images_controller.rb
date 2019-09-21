class Api::ImagesController < ApplicationController
  def index
    @images = Image.all
    render 'index.json.jb'
  end

  def create
    @image = Image.new(
                       url: params[:url]
                      )
    if @image.save
      render 'show.json.jb'
    else
      render json: {errors: @image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    
    @image.url = params[:url] || @image.url

    if @image.save
      render 'show.json.jb'
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    render json: {message: "Image Successfully Destroyed"}, 
  end
end