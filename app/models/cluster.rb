class Cluster < ApplicationRecord

	has_many :cluster_person
 	has_many :persons, through: :cluster_person

end
