class ProductsController < ApplicationController

	def index
		@products = Product.all.order(:registro)
	end
	
	def new
		@tipo = params[:tipo]
		@product = Product.new
		@persons = Person.all.order(:name)
		@clusters = Cluster.all

		@person_array = []
		@person_id_array = []
		@contact_array = []
		@rol_array = []
		@role_project_array = []
		8.times do |i|
			@person_array << 'Seleccione Investigador'
			@contact_array << 0
			@person_id_array << nil
			@rol_array << 0
			@role_project_array << 0
		end
		
	end

	def create
		@product = Product.new(product_params)
		@product.save

		[[:person_id_1,:contact_1, :rol_1, :role_project_1],[:person_id_2,:contact_2, :rol_2, :role_project_2],[:person_id_3,:contact_3, :rol_3, :role_project_3],[:person_id_4,:contact_4, :rol_4, :role_project_4],[:person_id_5,:contact_5, :rol_5, :role_project_5],[:person_id_6,:contact_6, :rol_6, :role_project_6],[:person_id_7,:contact_7, :rol_7, :role_project_7],[:person_id_8,:contact_8, :rol_8, :role_project_8]].each do |i|
			
			if params[:product][i[0]].to_i == 0
				break
			else
				@person_product = PersonProduct.new
				@person_product.product_id = Product.last.id
				@person_product.person_id = params[:product][i[0]]
				@person_product.contact = params[:product][i[1]]
				@person_product.rol = params[:product][i[2]]
				@person_product.role_project = params[:product][i[3]]
				@person_product.save
			end
		end

		calles

		if params[:product][:file] != nil
			@respaldo = Respaldo.new
			@respaldo.product_id = @product.id
			@respaldo.file = params[:product][:file]
			@respaldo.save
		end

		redirect_to products_path(), notice: 'el producto fue creado'
	end
	

	def edit
		@tipo = params[:tipo]
		@product = Product.find(params[:id])
		@persons = Person.all
		@clusters = Cluster.all
		@person_products = PersonProduct.where(product_id: params[:id])
		@person_array = []
		@person_id_array = []
		@contact_array = []
		@rol_array = []
		@role_project_array = []

		8.times do |i|
			if @person_products[i] != nil
				@person_array << @person_products[i].person.completename
				@contact_array << @person_products[i].contact
				@person_id_array << @person_products[i].person.id
				@rol_array << @person_products[i].rol
				@role_project_array << @person_products[i].role_project
			else
				@person_array << 'Seleccione Investigador'
				@person_id_array << nil
			end
		end


	end


	def update
		@product = Product.find(params[:id])
		@product.update(product_params)

		@person_product = PersonProduct.where(product_id: params[:id])
		@person_product.destroy_all

		[[:person_id_1,:contact_1, :rol_1, :role_project_1],[:person_id_2,:contact_2, :rol_2, :role_project_2],[:person_id_3,:contact_3, :rol_3, :role_project_3],[:person_id_4,:contact_4, :rol_4, :role_project_4],[:person_id_5,:contact_5, :rol_5, :role_project_5],[:person_id_6,:contact_6, :rol_6, :role_project_6],[:person_id_7,:contact_7, :rol_7, :role_project_7],[:person_id_8,:contact_8, :rol_8, :role_project_8]].each do |i|
			
			if params[:product][i[0]].to_i == 0
				break
			else
				@person_product = PersonProduct.new
				@person_product.product_id = Product.find(params[:id]).id
				@person_product.person_id = params[:product][i[0]]
				@person_product.contact = params[:product][i[1]]
				@person_product.rol = params[:product][i[2]]
				@person_product.role_project = params[:product][i[3]]
				@person_product.save
			end
		end

		calles

		if params[:product][:file] != nil
			@respaldo = Respaldo.new
			@respaldo.product_id = @product.id
			@respaldo.file = params[:product][:file]
			@respaldo.save
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
		params.require(:product).permit(:titulo, :revista, :tipo, :year, :doi, :volume, :pages, :partresearchers, :partpostdoc, :partundergrad, :partgrad, :fundfondap, :fundfondecyt, :fundfondef, :fundbasal, :fundicm, :fundother, :fundspecify, :indexacion, :editorial, :tipocongreso, :congreso, :lugar, :tipoorganizacion, :numpart, :institution, :tipocolaboracion, :estudiante, :genero, :rut, :grado, :inicio, :termino, :etapa, :monto, :registro, :cluster_id, :ditl_check, :brt_check, :cedeus_check, :cedeuscalles_check, :otros_autores)
	end
		

	def calles
		[:person_id_1,:person_id_2,:person_id_3,:person_id_4,:person_id_5,:person_id_6,:person_id_7].each do |i|
			if params[:product][i].to_i == 0
				break
			else 
				if Person.find(params[:product][i]).proyecto == "Calles"
					@product.calles = true
					@product.save
				end
			end
		end
	end

end




