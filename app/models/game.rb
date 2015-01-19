class Game < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :address, :city, :state, :user_id
end
