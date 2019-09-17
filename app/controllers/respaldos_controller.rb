class RespaldosController < ApplicationController

	def destroy
		@respaldo = Respaldo.find(params[:id])
		@respaldo.destroy
		redirect_to products_path
	end
end
