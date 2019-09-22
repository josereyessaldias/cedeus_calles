# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Person.destroy_all
Product.destroy_all

require 'csv'

noti = []

def abrir_seed(seed,base)
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
		noti.each do |i|
			base.create(
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
	elsif base == Person
		noti.each do |i|
			base.create(name: i[0],
				surname: i[1],
				completename: i[0].to_s + " " + i[1].to_s,
				cedeusname: i[1].to_s + ", " + i[0].to_s.capitalize[0] + ".",
				proyecto: i[2])
		end
	end
end

abrir_seed('seed_isi.csv',Product)
abrir_seed('seed_person.csv',Person)
