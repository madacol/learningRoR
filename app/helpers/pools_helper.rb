module PoolsHelper

	def categories
		return [ 'Odt', 'Inversion', 'Gg', 'Retencione', 'Employee' ]
	end

	def select_tag_for(pool, category, f)		
		f.select( :category_id, options_for_select( eval( 
			category+'.all.collect {|k| [k.record_name_to_show, k.id] }'), 
			(pool.category_id if pool.category_type == category) ), :class => "form-control", :prompt => '--Seleccionar--' )		
	end

end
