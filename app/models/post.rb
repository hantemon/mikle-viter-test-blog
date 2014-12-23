class Post < ActiveRecord::Base
	validates :post_title,   presence: true, length: { maximum: 255 }
	validates :post_content, presence: true
end
