class Post < ApplicationRecord


	 belongs_to :group

	 validates :content, presence: true



	 belongs_to :author, class_name: "User", foreign_key: :user_id

	 before_validation :strip_whitespace, :only => [:content]

 def editable_by?(user)
   user && user == author
 end



 def strip_whitespace
  self.content= self.content.lstrip unless self.content.nil?

end
end
