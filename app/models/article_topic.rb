class ArticleTopic < ActiveRecord::Base
	has_many :articles
	#test if graphic is image
	validates_format_of :graphic, :with=>/.*\.[(jpg)|(png)|(gif)|(bmp)]+/, 
	:message => "Plik musi być obrazkiem.", :allow_blank => true
end
