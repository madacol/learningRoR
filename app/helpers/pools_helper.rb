module PoolsHelper

	def categories
		return {'Odt'=> {'show' => 'Odt', 'method' => 'alias' }, 'Inversion'=> {'show' => 'Inversion', 'method' => 'code' }, 'Gg'=> {'show' => 'Gastos Generales', 'method' => 'code' }, 'Retencione'=> {'show' => 'Retenciones', 'method' => 'code_factura' }, 'Employee'=> {'show' => 'Empleado', 'method' => 'full_name' } }
	end

	def select_tag_for(pool, category)		
		select_tag( :category_id, options_for_select( eval( 
			category+'.all.collect {|k| [k.'+categories[category]['method']+', k.id] }'), 
			(pool.category_id if pool.category_type == category) ), :prompt => '--Seleccionar--' )		
	end

end
