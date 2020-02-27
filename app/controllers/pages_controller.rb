class PagesController < ApplicationController
  
  def ditl
  	@ditl_people = Person.where(ditl_check: "ditl_planta")
  	@products = Product.where(ditl_check: true)
  	@paper_wos = @products.where(tipo: "revista_isi")
  end

  def ditl_show
  	@person = Person.find(params[:id])
  	@person_tipos = []
		Product.where(ditl_check: true).tipos.keys.each do |type|
			@person.products.where(ditl_check: true).each do |product|
				if product.tipo == type
					@person_tipos << type
				end
			end
		end
		@person_tipos = @person_tipos.uniq
  end


end
