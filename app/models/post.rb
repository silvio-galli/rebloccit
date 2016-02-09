class Post < ActiveRecord::Base
	has_many :comments

	before_save :check_for_spam
	
	private
	def check_for_spam
		self.title = "SPAM" if self.id % 5 == 0
	end

end
