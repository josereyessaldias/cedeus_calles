class PersonsController < ApplicationController

	def index
		@persons = Person.all
	end
	
	def new
		@person = Person.new
	end

	def create
		@person = Person.new
		@person.name = params[:person][:name]
		@person.save
		redirect_to persons_path, notice: 'el investigador fue creado'
	end

	def destroy
		@person = Person.find(params[:id])
		@person.destroy
		redirect_to persons_path, notice: 'el investigador fue borrado'
	end

end
