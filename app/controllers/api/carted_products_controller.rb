class Api::CartedProductsController < ApplicationController


  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render 'index.json.jb'
  end 


  def create
    @carted_product = CartedProduct.new(
                                        status: "carted",
                                        user_id: current_user.id,
                                        product_id: params[:product_id],
                                        quantity: params[:quantity]
                                        )

    if @carted_product.save
      render json: {message: "#{@carted_product} added to cart successfully"}
    else 
      render json: {message: "Invalid attempt at adding to cart"}
    end 
  end 

  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status: "removed")


    render json: {message: "successfully destroyed carted product"}


  end 


end
