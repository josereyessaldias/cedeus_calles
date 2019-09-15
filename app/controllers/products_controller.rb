class ProductsController < ApplicationController

	def index
		@products = Product.all

		@tipos = []
		@products.each do |product|
			@tipos << product.tipo
		end
		@tipos = @tipos.uniq

		@temp = []
	end
	
	def new
		@tipo = params[:tipo]
		@product = Product.new
		@persons = Person.all

		@person_hash = []
		@person_id_hash = []
		8.times do |i|
			@person_hash << 'seleccione autor'
			@person_id_hash << nil
		end
		
	end

	def create
		@product = Product.new(product_params)
		@product.save

		[:person_id_1,:person_id_2,:person_id_3,:person_id_4,:person_id_5,:person_id_6,:person_id_7,:person_id_8].each do |i|
			
			if params[:product][i].to_i == 0
				break
			else
				@person_product = PersonProduct.new
				@person_product.product_id = Product.last.id
				@person_product.person_id = params[:product][i]
				@person_product.save
			end
		end

		redirect_to products_path(), notice: 'el producto fue creado'
	end
	

	def edit
		@tipo = params[:tipo]
		@product = Product.find(params[:id])
		@persons = Person.all
		@person_products = PersonProduct.where(product_id: params[:id])
		@person_hash = []
		@person_id_hash = []
		8.times do |i|
			if @person_products[i] != nil
				@person_hash << @person_products[i].person.name
				@person_id_hash << @person_products[i].person.id
			else
				@person_hash << 'seleccione autor'
				@person_id_hash << nil
			end
		end
	end


	def update
		@product = Product.find(params[:id])
		@product.update(product_params)

		@person_product = PersonProduct.where(product_id: params[:id])
		@person_product.destroy_all

		[:person_id_1,:person_id_2,:person_id_3,:person_id_4,:person_id_5,:person_id_6,:person_id_7,:person_id_8].each do |i|
			
			if params[:product][i].to_i == 0
				break
			else
				@person_product = PersonProduct.new
				@person_product.product_id = Product.find(params[:id]).id
				@person_product.person_id = params[:product][i]
				@person_product.save
			end
		end

		redirect_to products_path(), notice: 'el producto fue actualizado'
	end 

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, notice: 'el producto fue borrado'
	end



	private

	def product_params
		params.require(:product).permit(:titulo, :revista, :tipo, :year, :doi, :volume, :pages, :partresearchers, :partpostdoc, :partundergrad, :partgrad, :fundfondap, :fundfondecyt, :fundfondef, :fundbasal, :fundicm, :fundother, :fundspecify, :indexacion, :editores, :editorial)
	end
		

end




