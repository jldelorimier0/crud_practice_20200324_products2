class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end
  def create
    @product = Product.new(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}
    end
  end
  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end
  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.description = params[:description] || @product.description
    @product.price = params[:price] || @product.price
    render "show.json.jb"
  end
  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "Product #{product.id}, #{product.name}, has been destroyed."}
  end
end
