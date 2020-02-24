class CreationsController < ApplicationController

	def index
		@persons = Person.all
	end


	def show
		@person = Person.find(params[:id])
		@person_products = @person.products


	end


	

end
