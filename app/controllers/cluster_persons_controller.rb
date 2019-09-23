class ClusterPersonsController < ApplicationController

	def destroy
		@cluster_person = ClusterPerson.find(params[:id])
		@cluster_person.destroy
		redirect_to persons_path
	end

end
