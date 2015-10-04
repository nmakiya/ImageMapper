class Event < ActiveRecord::Base
  belongs_to :image

  geocoded_by :ip,
      :latitude => :lat, :longitude => :lon

  after_validation :geocode, :if => :ip_changed?
end
