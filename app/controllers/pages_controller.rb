class PagesController < ApplicationController
  def ditl
  	@products = Product.where(ditl_check: true)
  	@paper_wos = @products.where(tipo: "revista_isi")
  end
end
