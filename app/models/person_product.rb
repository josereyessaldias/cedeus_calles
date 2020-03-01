class PersonProduct < ApplicationRecord
  belongs_to :person
  belongs_to :product

  enum contact: { Sin_Información: 0, Presentó_Paper: 1, Sólo_Asisitió: 2, Coautor_No_Asistió: 3, Otro: 4 }
  enum rol: { author: 0, editor: 1, }
  enum role_project: { No_aplica: 0, investigador_responsable: 1, co_investigador:2}
  
  attribute :contact, :integer, default: :No_Aplica
  attribute :rol, :integer, default: :author


end
