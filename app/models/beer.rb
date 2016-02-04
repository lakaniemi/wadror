class Beer < ActiveRecord::Base
	include RatingAverage

	belongs_to :brewery
	has_many :ratings, dependent: :destroy;
	has_many :raters, through: :ratings, source: :user

	validates :name, presence: true

	def to_s
		"#{self.name} (#{Brewery.find(self.brewery_id).name})"
	end

end
