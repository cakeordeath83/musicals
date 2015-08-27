class Performance < ActiveRecord::Base
  belongs_to :show
  belongs_to :theatre
  
 
  
  validates :date, presence: true
  
  
end
