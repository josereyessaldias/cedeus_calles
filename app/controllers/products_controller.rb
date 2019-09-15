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
	end

	def create
		@product = Product.new
		@product.titulo = params[:product][:titulo]
		@product.revista = params[:product][:revista]
		@product.tipo = params[:product][:tipo]
		@product.year = params[:product][:year]
		@product.doi = params[:product][:doi]
		@product.volume = params[:product][:volume]
		@product.pages = params[:product][:pages]
		@product.partresearchers = params[:product][:partresearchers]
		@product.partpostdoc = params[:product][:partpostdoc]
		@product.partundergrad = params[:product][:partundergrad]
		@product.partgrad = params[:product][:partgrad]
		@product.fundfondap = params[:product][:fundfondap]
		@product.fundfondecyt = params[:product][:fundfondecyt]
		@product.fundfondef = params[:product][:fundfondef]
		@product.fundbasal = params[:product][:fundbasal]
		@product.fundicm = params[:product][:fundicm]
		@product.fundother = params[:product][:fundother]
		@product.fundspecify = params[:product][:fundspecify]
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
		@product.update(titulo: params[:product][:titulo])
		@product.update(revista: params[:product][:revista])
		@product.update(tipo: params[:product][:tipo])
		@product.update(year: params[:product][:year])
		@product.update(doi: params[:product][:doi])
		@product.update(volume: params[:product][:volume])
		@product.update(pages: params[:product][:pages])
		@product.update(partresearchers: params[:product][:partresearchers])
		@product.update(partpostdoc: params[:product][:partpostdoc])
		@product.update(partundergrad: params[:product][:partundergrad])
		@product.update(partgrad: params[:product][:partgrad])
		@product.update(fundfondap: params[:product][:fundfondap])
		@product.update(fundfondecyt: params[:product][:fundfondecyt])
		@product.update(fundfondef: params[:product][:fundfondef])
		@product.update(fundbasal: params[:product][:fundbasal])
		@product.update(fundicm: params[:product][:fundicm])
		@product.update(fundother: params[:product][:fundother])
		@product.update(fundspecify: params[:product][:fundspecify])


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
end
