class Event < ActiveRecord::Base
  belongs_to :image

  geocoded_by :ip,
      :latitude => :latitude, :longitude => :longitude

  after_validation :geocode, :if => :ip_changed?
end
