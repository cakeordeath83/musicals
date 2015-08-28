class Theatre < ActiveRecord::Base
  has_many :performances
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  
  validates :name, presence: true, uniqueness: true
  
  geocoded_by :name
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude 
  after_validation :fetch_address
end
