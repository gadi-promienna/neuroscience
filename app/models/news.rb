class News < ActiveRecord::Base
  belongs_to :author
  validates_format_of :graphic, :with=>/.*\.[(jpg)|(png)|(gif)|(bmp)]+/, 
	:message => "Plik musi być obrazkiem.", :allow_blank => true
end
