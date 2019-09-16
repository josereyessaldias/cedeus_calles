class ProductsController < ApplicationController

	def index
		@products = Product.all
	end
	
	def new
		@tipo = params[:tipo]
		@product = Product.new
		@persons = Person.all

		@person_array = []
		@person_id_array = []
		@contact_array = []
		@rol_array = []
		8.times do |i|
			@person_array << 'seleccione autor'
			@contact_array << 0
			@person_id_array << nil
			@rol_array << 0
		end
		
	end

	def create
		@product = Product.new(product_params)
		@product.save

		[[:person_id_1,:contact_1, :rol_1],[:person_id_2,:contact_2, :rol_2],[:person_id_3,:contact_3, :rol_3],[:person_id_4,:contact_4, :rol_4],[:person_id_5,:contact_5, :rol_5],[:person_id_6,:contact_6, :rol_6],[:person_id_7,:contact_7, :rol_7],[:person_id_8,:contact_8, :rol_8]].each do |i|
			
			if params[:product][i[0]].to_i == 0
				break
			else
				@person_product = PersonProduct.new
				@person_product.product_id = Product.last.id
				@person_product.person_id = params[:product][i[0]]
				@person_product.contact = params[:product][i[1]]
				@person_product.rol = params[:product][i[2]]
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
		@person_array = []
		@person_id_array = []
		@contact_array = []
		@rol_array = []
		8.times do |i|
			if @person_products[i] != nil
				@person_array << @person_products[i].person.name
				@contact_array << @person_products[i].contact
				@person_id_array << @person_products[i].person.id
				@rol_array << @person_products[i].rol
			else
				@person_array << 'seleccione autor'
				@person_id_array << nil
			end
		end


	end


	def update
		@product = Product.find(params[:id])
		@product.update(product_params)

		@person_product = PersonProduct.where(product_id: params[:id])
		@person_product.destroy_all

		[[:person_id_1,:contact_1, :rol_1],[:person_id_2,:contact_2, :rol_2],[:person_id_3,:contact_3, :rol_3],[:person_id_4,:contact_4, :rol_4],[:person_id_5,:contact_5, :rol_5],[:person_id_6,:contact_6, :rol_6],[:person_id_7,:contact_7, :rol_7],[:person_id_8,:contact_8, :rol_8]].each do |i|
			
			if params[:product][i[0]].to_i == 0
				break
			else
				@person_product = PersonProduct.new
				@person_product.product_id = Product.find(params[:id]).id
				@person_product.person_id = params[:product][i[0]]
				@person_product.contact = params[:product][i[1]]
				@person_product.rol = params[:product][i[2]]
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
		params.require(:product).permit(:titulo, :revista, :tipo, :year, :doi, :volume, :pages, :partresearchers, :partpostdoc, :partundergrad, :partgrad, :fundfondap, :fundfondecyt, :fundfondef, :fundbasal, :fundicm, :fundother, :fundspecify, :indexacion, :editores, :editorial, :file)
	end
		

end




