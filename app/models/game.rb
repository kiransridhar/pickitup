class Game < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates_presence_of :name, :address, :city, :state, :user_id, :zip
  geocoded_by :zip
  after_validation :geocode, :if => :zip_changed?
end
