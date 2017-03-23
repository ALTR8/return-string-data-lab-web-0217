class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def description
		product = Product.find(params[:id])
		render plain: product.description
	end

	def inventory
		product = Product.find(params[:id])
		render plain: product.inventory == nil || product.inventory < 1 ? "false" : "true"
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.create(params.require(:product).permit(:name, :description, :inventory, :price))
		redirect_to products_path
	end

end
