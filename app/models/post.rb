class Post < ActiveRecord::Base
	validates :post_title,   presence: true, length: { maximum: 255 }
	validates :post_content, presence: true

	def self.make_search(query)
  		where("post_title like ? OR post_content like ?", "%#{query}%", "%#{query}%") 
	end
end
