class Pool < ActiveRecord::Base  
  belongs_to :category, polymorphic: true
  
  def categories
    return {'Odt'=> {'show' => 'Odt', 'method' => 'alias' }, 'Inversion'=> {'show' => 'Inversion', 'method' => 'code' }, 'Gg'=> {'show' => 'Gastos Generales', 'method' => 'code' }, 'Retencione'=> {'show' => 'Retenciones', 'method' => 'code_factura' }, 'Employee'=> {'show' => 'Empleado', 'method' => 'full_name' } }
  end
  def show_category
  	self.categories[self.category_type]['show']
  end
  def show_category_name
  	eval( 'self.category.'+self.categories[self.category_type]['method'] )
  end

end
