class PagesController < ApplicationController
  
  def ditl
  	@ditl_people = Person.where(ditl_check: "ditl_planta").order(:surname)
    @ditl_otros = Person.where(ditl_check: "ditl_otros").order(:surname)
    @ditl_estudiantes = Person.where(ditl_check: "ditl_estudiante").order(:surname)
  	@products = Product.where(ditl_check: true)
  	@paper_wos = @products.where(tipo: "revista_isi").order(registro: :desc)
    @participacion = @products.where(tipo: "congreso").order(registro: :desc)
    @proyectos = @products.where(tipo: "financiamiento").order(registro: :desc)

    #@product_graph = @ditl_people.joins(:products).merge(Product.where(:products => {:tipo => "revista_isi", :ditl_check => true} ))
    @years = [2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020]
    @hash = {}
    @years.each do |year|
      @hash[year] = Product.where(:registro => year,:tipo => "revista_isi", :ditl_check => true).count
    end
    @graph = [{:name => "DITL", :data => @hash , :visible => false}]
    @ditl_people.each do |persona|
      @hash = {}
      @years.each do |year|
        @hash[year] = persona.products.where(:registro => year,:tipo => "revista_isi", :ditl_check => true).count
      end 

      @graph << {:name => persona.surname, :data => @hash }
    end


  end

  def ditl_show
  	@person = Person.find(params[:id])
    @person_products = @person.products.order(registro: :desc)
    @paper_wos = @person_products.where(tipo: "revista_isi")
  	
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
