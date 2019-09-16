class PersonProductsController < ApplicationController

	def destroy
		@person_product = PersonProduct.find(params[:id])
		@person_product.destroy
		redirect_to products_path

	end
end
