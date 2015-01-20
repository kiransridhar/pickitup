class Game < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates_presence_of :name, :address, :city, :state, :user_id

  def self.search(query)
    if query
      where(
      "plainto_tsquery(?) @@ " +
      "to_tsvector('english', LOWER(name) || ' ' || city)",
      query
      )
      where(["LOWER(name) LIKE ?", "%" + query.downcase + "%"])
    else
      all
    end
  end
end
