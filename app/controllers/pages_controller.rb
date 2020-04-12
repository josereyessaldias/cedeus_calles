class PagesController < ApplicationController
  
  def ditl
  	@ditl_people = Person.where(ditl_check: "ditl_planta").order(:surname)
    @ditl_otros = Person.where(ditl_check: "ditl_otros").order(:surname)
    @ditl_estudiantes = Person.where(ditl_check: "ditl_estudiante").order(:surname)
  	@products = Product.where(ditl_check: true)
  	@paper_wos = @products.where(tipo: "revista_isi").order(registro: :desc)
    @participacion = @products.where(tipo: "congreso").order(registro: :desc)
    @proyectos = @products.where(tipo: "financiamiento").order(registro: :desc)
  end

  def ditl_show
  	@person = Person.find(params[:id])
    @person_products = @person.products.order(registro: :desc)
  	
    @person_tipos = []
		Product.tipos.keys.each do |type|
			@person_products.each do |product|
				if product.tipo == type
					@person_tipos << type
				end
			end
		end
		@person_tipos = @person_tipos.uniq

  end


end
