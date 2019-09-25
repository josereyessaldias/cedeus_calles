# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Person.destroy_all
Product.destroy_all
Cluster.destroy_all

require 'csv'

noti = []

def abrir_seed(seed,base,clase)
	archivo = File.open(Rails.root.join('lib',seed), 'r:iso-8859-1')
	notas = archivo.readlines
	archivo.close

	noti = []
	notas.each do |i|
		noti << i.split(",")
	end

	noti.each do |i|
		i[-1].delete!("\n")
	end

	if base == Product
		if clase == "revista_isi"
			noti.each do |i|
				base.create(
							tipo:clase,
							registro: i[0],
							doi: i[2],
							titulo:i[4],
							revista:i[5],
							volume: i[6],
							pages: i[7],
							year: i[8],
							partresearchers: i[9],
							partpostdoc: i[10],
							partundergrad: i[11],
							partgrad: i[12],
							fundfondap: i[13],
							fundfondecyt: i[14],
							fundfondef: i[15],
							fundbasal: i[16],
							fundicm: i[17],
							fundother: i[18],
							fundspecify: i[19])
			end
		elsif clase == "revista_no_isi"
			noti.each do |i|
				base.create(tipo:clase,
							registro: i[0],
							doi: i[2],
							titulo:i[4],
							revista:i[5],
							volume: i[6],
							pages: i[7],
							year: i[8],
							indexacion: i[9],
							partresearchers: i[10],
							partpostdoc: i[11],
							partundergrad: i[12],
							partgrad: i[13],
							fundfondap: i[14],
							fundfondecyt: i[15],
							fundfondef: i[16],
							fundbasal: i[17],
							fundicm: i[18],
							fundother: i[19],
							fundspecify: i[20])
			end

		elsif clase == "libro"
			noti.each do |i|
				base.create(tipo:clase,
							registro: i[0],
							revista: i[4],
							titulo: i[5],
							pages: i[6],
							editorial: i[7],
							year: i[8])
			end

		elsif clase == "congreso"
			noti.each do |i|
				base.create(tipo:clase,
							registro: i[0],
							tipocongreso: i[1].to_i,
							congreso: i[3],
							titulo: i[4],
							lugar: i[6],
							year: i[7],
							partresearchers: i[8],
							partpostdoc: i[9],
							partundergrad: i[10],
							partgrad: i[11])
			end

		elsif clase == "organizacion"
			noti.each do |i|
				base.create(tipo:clase,
							registro: i[0],
							tipoorganizacion: i[1].to_i,
							titulo: i[3],
							numpart: i[4].to_i,
							year: i[5],
							lugar: i[6],
							cluster_id: i[7].to_i)
			end

		elsif clase == "colaboracion"
			noti.each do |i|
				base.create(tipo:clase,
							registro: i[0],
							tipocolaboracion: i[2],
							lugar: i[4],
							institution: i[5],
							year: i[6])
			end

		elsif clase == "tesis"
			noti.each do |i|
				base.create(tipo:clase,
							registro: i[0],
							etapa: i[2].to_i,
							estudiante: i[3],
							rut: i[4],
							genero: i[5],
							titulo: i[6],
							grado: i[7].to_i,
							institution: i[9],
							year: i[10],
							inicio: i[11],
							termino: i[12])
			end
		elsif clase == "financiamiento"
			noti.each do |i|
				base.create(tipo:clase,
							titulo: i[0],
							inicio: i[1],
							termino: i[2],
							monto: i[3].to_i)
			end

		end

	elsif base == Person
		noti.each do |i|
			base.create(name: i[0],
				surname: i[1],
				completename: i[0].to_s + " " + i[1].to_s,
				cedeusname: i[1].to_s + ", " + i[0].to_s.capitalize[0] + ".",
				proyecto: i[2])
		end

	elsif base == Cluster
		noti.each do |i|
			base.create(name: i[0])
		end

	elsif base == ClusterPerson
		noti.each do |i|
			base.create(person_id: i[0].to_i,
						cluster_id: i[1].to_i)
		end

	elsif base == PersonProduct
		noti.each do |i|
			base.create(product_id: i[0].to_i,
						person_id: i[1].to_i,
						rol: i[2].to_i)
		end
	end
end

abrir_seed('seed_cluster.csv',Cluster,"")
abrir_seed('seed_person.csv',Person,"")
abrir_seed('seed_cluster_person.csv',ClusterPerson,"")
abrir_seed('seed_isi.csv',Product,"revista_isi")
abrir_seed('seed_no_isi.csv',Product,"revista_no_isi")
abrir_seed('seed_libro.csv',Product,"libro")
abrir_seed('seed_congreso.csv',Product,"congreso")
abrir_seed('seed_organizacion.csv',Product,"organizacion")
abrir_seed('seed_tesis.csv',Product,"tesis")
abrir_seed('seed_person_product.csv',PersonProduct,"")

Product.all.each do |product|
	product.persons.each do |person|
		if person.proyecto == "Calles"
			product.calles = true
			product.save
		end
	end
end