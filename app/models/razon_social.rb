class RazonSocial < ActiveRecord::Base
    validates_presence_of :name, presence: true, :message => "no puede estar vacío"
    validates_presence_of :rif_ci, presence: true, :message => "no puede estar vacío"
    has_many :odts
    has_many :retenciones
    has_many :bdvs
    has_many :pools
    has_many :bods
    has_many :mercantils
    has_many :banescos
    has_many :provincials

    def table_name_to_show
    	'Razon Social'
    end
    def record_name_to_show
    	return self.name
    end
end