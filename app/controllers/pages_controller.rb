class PagesController < ApplicationController
  
  def ditl
  	@ditl_people = Person.where(ditl_check: "ditl_planta")
  	@products = Product.where(ditl_check: true)
  	@paper_wos = @products.where(tipo: "revista_isi")
  end

  def ditl_show
  	@person = Person.find(params[:id])
  end


end
