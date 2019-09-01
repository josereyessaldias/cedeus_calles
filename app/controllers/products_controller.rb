class ProductsController < ApplicationController

	def index
		@products = Product.all
	end
	
	def new
		@product = Product.new
	end

	def create
		@product = Product.new
		@product.titulo = params[:product][:titulo]
		@product.revista = params[:product][:revista]
		@product.tipo = params[:product][:tipo]
		@product.year = params[:product][:year]
		@product.save
		redirect_to products_path, notice: 'el producto fue creado'
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, notice: 'el producto fue borrado'
	end
end
