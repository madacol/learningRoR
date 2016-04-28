class Pool < ActiveRecord::Base  
  belongs_to :category, polymorphic: true 
  belongs_to :razon_social   
end
