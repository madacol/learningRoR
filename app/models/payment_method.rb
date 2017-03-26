class PaymentMethod < ActiveRecord::Base
  belongs_to :account
  has_many :pools
  enum status: ["Inactiva","Activa"]

  def record_name_to_show
    return self.method
  end
  
  def table_name_to_show
    'Métodos de pago'
  end
end
