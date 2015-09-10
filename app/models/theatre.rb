class Theatre < ActiveRecord::Base
  has_many :performances, :dependent => :restrict_with_error
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  
  
  
  geocoded_by :theatreadd
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude 
  after_validation :fetch_address
  
  def theatreadd
    theatreadd = "#{self.name} + #{self.city}"
  end
 
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%") 
  end
  
  
end
