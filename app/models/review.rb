class Review < ApplicationRecord
	validate :movie_review_validate

	validates :user_id, uniqueness: { scope: :movie_id}
	belongs_to :user
	belongs_to :movie

	def movie_review_validate
	  	if movie.user == self.user
	  		errors.add(:movie, "not able to review the movie")
	  	end
	end
end
