class ClustersController < ApplicationController

	def index
		@clusters = Cluster.all
	end

	def new
		@cluster = Cluster.new
	end

	def create
		@cluster = Cluster.new
		@cluster.name = params[:cluster][:name]
		@cluster.save
		redirect_to clusters_path, notice: 'el cluster fue creado'
	end

	def destroy
		@cluster = Cluster.find(params[:id])
		@cluster.destroy
		redirect_to clusters_path, notice: 'el cluster fue borrado'
	end
end
