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
		@product.tipo = params[:tipo]
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

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, notice: 'el producto fue borrado'
	end
end
