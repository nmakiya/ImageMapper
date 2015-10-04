class Image < ActiveRecord::Base
  belongs_to :user
  has_many :events

  has_attached_file :image
end
