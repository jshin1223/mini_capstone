class Api::OrdersController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]


  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end 


  def create
    # current_user
    # params hash {"product_id"=>"2", "quantity"=>"3"}

    if current_user 
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    subtotal = product.price * quantity
    tax = subtotal * 0.09
    total = tax + subtotal

    @order = Order.new(
                      user_id: current_user.id,
                      product_id: params[:product_id],
                      quantity: params[:quantity],
                      subtotal: subtotal,
                      tax: tax,
                      total: total
                      )
    if @order.save
      render 'show.json.jb'
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessible_entity
    end 
  end

  def show
    @order = Order.find(params[:product_id])
    render 'show.json.jb'
  end 
end 


