class PersonsController < ApplicationController

	def index
		@persons = Person.all
		#@persons = Person.joins(:clusters).where(:clusters => {:name => "Access and Mobility"})
		@products_calles = Product.where.not(tipo: ["congreso","tesis"])
		


	end
	
	def new
		@person = Person.new
		@clusters = Cluster.all
	end

	def create
		@person = Person.new
		@person.name = params[:person][:name]
		@person.surname = params[:person][:surname]
		@person.cedeusname = @person.surname + ", " + @person.name.capitalize[0] + "."
		@person.completename = @person.name + " " + @person.surname
		@person.ditl_check = params[:person][:ditl_check]
		@person.proyecto = params[:person][:proyecto]
		@person.save
		@cluster = ClusterPerson.new
		@cluster.person_id = Person.last.id
		@cluster.cluster_id = params[:person][:cluster_id_1]
		@cluster.save
		if params[:person][:cluster_id_2] != nil
			@cluster = ClusterPerson.new
			@cluster.person_id = Person.last.id
			@cluster.cluster_id = params[:person][:cluster_id_2]
			@cluster.save
		end
		if params[:person][:cluster_id_3] != nil
			@cluster = ClusterPerson.new
			@cluster.person_id = Person.last.id
			@cluster.cluster_id = params[:person][:cluster_id_3]
			@cluster.save
		end
		redirect_to persons_path, notice: 'el investigador fue creado'
	end

	def edit
		@person = Person.find(params[:id])
		@clusters = Cluster.all
		@cluster_person = ClusterPerson.where(person_id: params[:id])

		@cluster_array = []
		@cluster_id_array = []

		3.times do |i|
			if @cluster_person[i] != nil
				@cluster_array << @cluster_person[i].cluster.name
				@cluster_id_array << @cluster_person[i].cluster_id
			else
				@cluster_array << 'Seleccione Otro Cluster'
				@cluster_id_array << nil
			end
		end



	end

	def update
		@person = Person.find(params[:id])
		@person.update(name: params[:person][:name])
		@person.update(surname: params[:person][:surname])
		@person.update(cedeusname: @person.surname + ", " + @person.name.capitalize[0] + ".")
		@person.update(completename: @person.name + " " + @person.surname)
		@person.update(ditl_check: params[:person][:ditl_check])
		@person.update(proyecto: params[:person][:proyecto])

		@cluster_person = ClusterPerson.where(person_id: @person.id)
		@cluster_person.destroy_all

		@cluster = ClusterPerson.new
		@cluster.person_id = @person.id
		@cluster.cluster_id = params[:person][:cluster_id_1]
		@cluster.save
		if params[:person][:cluster_id_2] != nil
			@cluster = ClusterPerson.new
			@cluster.person_id = @person.id
			@cluster.cluster_id = params[:person][:cluster_id_2]
			@cluster.save
		end
		if params[:person][:cluster_id_3] != nil
			@cluster = ClusterPerson.new
			@cluster.person_id = @person.id
			@cluster.cluster_id = params[:person][:cluster_id_3]
			@cluster.save
		end
		redirect_to persons_path, notice: 'el investigador fue editado'
	end


	def show
		@person = Person.find(params[:id])
		@person_tipos = []
		Product.tipos.keys.each do |type|
			@person.products.each do |product|
				if product.tipo == type
					@person_tipos << type
				end
			end
		end
		@person_tipos = @person_tipos.uniq
	end

	def destroy
		@person = Person.find(params[:id])
		@person.destroy
		redirect_to persons_path, notice: 'el investigador fue borrado'
	end

end
