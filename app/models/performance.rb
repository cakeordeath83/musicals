class Performance < ActiveRecord::Base
  belongs_to :show
  belongs_to :theatre
  
 
  
  accepts_nested_attributes_for :show
  accepts_nested_attributes_for :theatre
  
  
  
  
end
