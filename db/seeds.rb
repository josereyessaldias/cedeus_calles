# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

noti = []

def abrir_seed(seed)
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

	noti.each do |i|
		Product.create(
					tipo:"revista_isi",
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
end

abrir_seed('seed_isi.csv')