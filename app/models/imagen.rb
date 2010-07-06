class Imagen < ActiveRecord::Base
  belongs_to :paciente
  has_one :db_file
  #validates

  validates_presence_of :archivo_id, :descripcion, :message => ', no debe estar vacío'
  
  
end