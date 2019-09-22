class Product < ApplicationRecord

	has_many :person_product, dependent: :destroy
 	has_many :persons, through: :person_product
 	has_many :respaldos, dependent: :destroy

 	enum tipo: { revista_isi: 0, revista_no_isi: 1, libro: 2, congreso: 3, organizacion: 4, colaboracion: 5, tesis: 6, financiamiento: 7 }

	enum tipocongreso: {International_congress: 1, national_congress: 2, workshop: 3, course: 4, conferece: 5}

	enum tipoorganizacion: {Inter_congress: 1, Latinamerican_congress:2, Nat_congress: 3, Workshop: 4, Course: 5, Conferece: 6}

	enum tipocolaboracion: {Visita_a_Chile: 1, Visita_al_extranjero: 2 }

	enum genero: {Femenino: 1, Masculino: 2 }

	enum grado: {Pregado: 1, Magister: 2, Doctorado: 3}

	enum etapa: {Terminada: 1, En_Preparacion: 2}
end
