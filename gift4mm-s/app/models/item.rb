class Item < ApplicationRecord
mount_uploader :image, ImageUploader 
#validates :content, presence: true, length: { maximum: 140 } 

def self.search(query)
  where("title like ? OR description like ? OR price like ?" , "%#{query}%", "%#{query}%", "%#{query}%") 

end

end