class User < ActiveRecord::Base
	include RatingAverage

	has_secure_password

	has_many :ratings
	has_many :memberships
	has_many :beers, through: :ratings
	has_many :beer_clubs, through: :memberships

	validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }

end