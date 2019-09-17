class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]


  def index
    search_term = params[:search]
    discount_option = params[:discount]
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    discount_level = 60


    @products = Product.all

    
    if search_term
      @products = @products.where("name iLIKE ?", "%#{search_term}%")
    end

    if discount_option == "true"
      @products = @products.where("price < ?", discount_level)
    end 


    if sort_attribute && sort_order 
      @products = @products.order(sort_attribute => sort_order)
    elsif sort_attribute 
      @product = @products.order(sort_attribute)
    else
      @product = @products.order(:id)
    end 

      render 'index.json.jb'
  end

  def create
    @product = Product.new(
                           
                            name: params[:name],
                            price: params[:price],
                            description: params[:description],
                            supplier_id: params[:supplier_id]
                          )
    if @product.save
      render 'show.json.jb'
    else 
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end 
  end




  def show
    @product = Product.find(params[:id])
    render 'show.json.jb'
  end


  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description

    if @product.save
      render 'show.json.jb'
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Successfully Destroyed Product."}
  end 

end


