class RazonSocial < ActiveRecord::Base
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
