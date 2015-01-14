class Court < ActiveRecord::Base
  validates_presence_of :name, :address, :city, :state, :zip, :user_id
end
