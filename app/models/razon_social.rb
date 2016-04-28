class RazonSocial < ActiveRecord::Base
    has_many :odts
    has_many :retenciones
    has_many :pools

    def table_name_to_show
    	'Razon Social'
    end
    def record_name_to_show
    	return self.name
    end
end
