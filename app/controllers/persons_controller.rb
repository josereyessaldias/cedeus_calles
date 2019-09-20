class PersonsController < ApplicationController

	def index
		@persons = Person.all

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
