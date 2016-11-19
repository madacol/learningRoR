module PoolsHelper

  def categories
    return [ 'Odt', 'Inversion', 'Gg', 'Retencione', 'Employee' ]
  end
  def categories_grouped_options
    categories.collect do |category|
      subcategories = eval(category).all.collect do |subcategory|
        [subcategory.record_name_to_show, "#{category}:#{subcategory.id}"]
      end
      [eval(category).new.category_name_to_show, subcategories]
    end
  end
end
