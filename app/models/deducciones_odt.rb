class DeduccionesOdt < ActiveRecord::Base
  belongs_to :odt
  
    def table_name_to_show
    	'Porcentaje de deduccion'
    end
    def record_name_to_show
    	return self.p_gasto
    end
end
