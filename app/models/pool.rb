class Pool < ActiveRecord::Base  
  belongs_to :category, polymorphic: true
  
  def categories
    return {'Odt'=>'Odt', 'Inversion'=>'Inversion', 'Gg'=>'Gastos Generales', 'Retencione'=>'Retenciones', 'Employee'=>'Empleado'}
  end
end
