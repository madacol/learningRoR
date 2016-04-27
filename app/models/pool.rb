class Pool < ActiveRecord::Base  
  belongs_to :category, polymorphic: true  
end
