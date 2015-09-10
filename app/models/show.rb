class Show < ActiveRecord::Base
  has_many :performances, :dependent => :restrict_with_error
  has_attached_file :picture, 
  styles: { medium: "300x300>", thumb: '100x100' }, 
  default_url: "/images/:style/missing.png"  
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, uniqueness: true
 
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%") 
  end
  
end
