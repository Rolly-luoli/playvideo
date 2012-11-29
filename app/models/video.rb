class Video < ActiveRecord::Base
  
  attr_accessible :name, :videocontent
  attr_accessible :avatar, :avatar_cache
  mount_uploader :avatar, AvatarUploader

  validates   :name,  :presence  =>true,
                                   :length => { :maximum  =>100 }    
end
