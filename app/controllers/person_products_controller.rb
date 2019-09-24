class PersonProductsController < ApplicationController

	def destroy
		@person_product = PersonProduct.find(params[:id])
		@product = Product.find(@person_product.product_id)
		@person_product.destroy

		if @product.calles == true
			@temp = 0
			@product.persons.each do |person|
				if person.proyecto == "Calles"
					@temp += 1
				end
			end
			if @temp == 0
				@product.calles = false
				@product.save
			end
		end

		redirect_to products_path

	end
end
