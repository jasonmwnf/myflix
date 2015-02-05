class Category < ActiveRecord::Base
<<<<<<< HEAD
  has_many :videos, -> {order("created_at DESC")}

  def recent_videos
     videos.first(6)
=======
  has_many :videos, -> {order("title")}

  def recent_videos
    videos.first(6)
>>>>>>> bac4806e8b07a00d4eabfff6bc6ee134df5ab893
  end
end