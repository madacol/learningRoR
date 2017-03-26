class Account < ActiveRecord::Base
	has_many :pools
	has_many :cierres
	has_many :payment_methods

  def record_name_to_show
    return self.name    
  end
  
  def table_name_to_show
    'Cuentas'
  end
end