Hash do
  self.forma_de_pagos.collect do |k,v|
    if k.is_integer?
      [PaymentCard.find(k).card_name_to_show, v]
    else
      [k,v]
    end
  end
end

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

def has_auth (action)
  AuthGroup.all.each do |ag|
    case ag[action]
    when true
      return true 
    when nil
      return 'not found'
    end
  end
  return false
end

class As

  def repeatfirst
  	return saymyname
  end
  def initialize(name)
    @name = name
  end
  def saymyname
    return 'my name is '+@name
  end
  def name
    return @name
  end
  def repeatlast
  	return saymyname
  end

end

def new_row_pool (category, code)
  p=Pool.new
  case category
  when "odt_id"
    p.odt_id=code
  when "gg_id"
    p.gg_id=code
  when "inversion_id"
    p.inversion_id=code
  when "retencione_id"
    p.retencione_id=code
  when "eployee_id"
    p.eployee_id=code
  else 
  	puts 'It is not a category, try again'
  	return
  end
  return p
end

def new_row_pool (category, code)
  p=self.new
    p[category]=code
  return p
end


class ChangeRelationsToPool < ActiveRecord::Migration
  def change
  	remove_column :pools, :odt_id
  	remove_column :pools, :gg_id
  	remove_column :pools, :inversion_id
  	remove_column :pools, :retencione_id
  	remove_column :pools, :employee_id

	add_reference :pools, :category, polymorphic: true, index: true
  end
end

def categories
	return ['Odt', 'Inversion', 'Gg', 'Retencione', 'Employee']
end

 <div class="field">
    <%= label_tag( 'pool_category_type', 'Categoría' ) %><br>
    <%= f.select( :category_type, options_for_select( @pool.categories.collect {|c| c.reverse}), :prompt => '--Seleccionar--' ) %>
  </div>

  <% @pool.categories.keys.each do |category| %>
    <div id= <%= category %> class="field hidden">
      <%= label_tag( 'pool_category_id', 'Código' ) %><br>
      <%= select_tag( :category_id, options_for_select( eval( category+'.all.collect {|k| [k.code,k.id] }') ), class: 'asd', :prompt => '--Seleccionar--' ) %>
    </div>
  <% end %>



----

   <div id= <%= code %> class="field hidden">
      <% case code %>
        <% when 'Odt'%>
          <%= label_tag( 'pool_category_id', 'Código' ) %><br>
          <%= select_tag( :category_id, options_for_select( 'Odt'+'.all.collect {|k| [k.code,k.id] }'), class: 'asd', :prompt => '--Seleccionar--' ) %> 
        <% when 'Inversion'%>
          <%= label_tag( 'pool_category_id', 'Código' ) %><br>
          <%= select_tag( :category_id, options_for_select( eval( 'Inversion'+'.all.collect {|k| [k.code,k.id] }') ), class: 'asd', :prompt => '--Seleccionar--' ) %> 
        <% when 'Gg'%>
          <%= label_tag( 'pool_category_id', 'Código' ) %><br>
          <%= select_tag( :category_id, options_for_select( eval( 'Gg'+'.all.collect {|k| [k.code,k.<%=id] }') ), class: 'asd', :prompt => '--Seleccionar--' ) %>
        <% when 'Retencione'%>
         <%= label_tag( 'pool_category_id', 'Código' ) %><br>
         <%= select_tag( :category_id, options_for_select( eval( 'Retencione'+'.all.collect {|k| [k.code,k.id] }') ), class: 'asd', :prompt => '--Seleccionar--' ) %>
        <% when 'Employee'%>
          <% e=Employee.name %>
          <%= label_tag( 'pool_category_id', 'Código' ) %><br>
          <%= select_tag( :e, options_for_select( eval( 'Employee'+'.all.collect {|k| [k.e,k.id] }') ), class: 'asd', :prompt => '--Seleccionar--' ) %>
      <% end %>
    </div>

    def poolselect(code)
	  case code
	  when 'Odt'
	   label_tag( 'pool_category_id', 'Código' ) <br>
       select_tag( :category_id, options_for_select( eval( 'Odt'+'.all.collect {|k| [k.code,k.id] }') ), class: 'asd', :prompt => '--Seleccionar--' ) 
	  when 'Inversion'
	   label_tag( 'pool_category_id', 'Código' ) <br>
       select_tag( :category_id, options_for_select( eval( 'Inversion'+'.all.collect {|k| [k.code,k.id] }') ), class: 'asd', :prompt => '--Seleccionar--' ) 
	  when 'Gg'
	   label_tag( 'pool_category_id', 'Código' ) <br>
       select_tag( :category_id, options_for_select( eval( 'Gg'+'.all.collect {|k| [k.code,k.id] }') ), class: 'asd', :prompt => '--Seleccionar--' )
	  when 'Retencione'
	   label_tag( 'pool_category_id', 'Código' ) <br>
       select_tag( :category_id, options_for_select( eval( 'Retencione'+'.all.collect {|k| [k.code,k.id] }') ), class: 'asd', :prompt => '--Seleccionar--' )
	  when 'Employee'
	  	e=Employee.name
	   label_tag( 'pool_category_id', 'Código' ) <br>
       select_tag( :e, options_for_select( eval( 'Employee'+'.all.collect {|k| [k.e,k.id] }') ), class: 'asd', :prompt => '--Seleccionar--' )
	  else 
	  	puts 'lfsfkn'
	  	return
	  end
	end