class Contact < ActiveRecord::Base
email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :name, :presence =>true,
				 :length =>{ :maximum => 50}
validates :email, :presence => true,
				  :format =>{ :with => email_regex}
validates :organisation, :presence =>true,
				 :length =>{ :maximum => 50}
validates :enquiry, :presence =>true,
				 :length =>{ :maximum => 1000}


end
