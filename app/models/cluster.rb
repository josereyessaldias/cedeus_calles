class Cluster < ApplicationRecord

	has_many :cluster_person, dependent: :destroy
 	has_many :persons, through: :cluster_person

end
