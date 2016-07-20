class PagesController < ApplicationController
	def index
		@users = User.all
		@votes = Vote.all
		@candidates = Candidate.all
		@positions = Position.all
		render "pages/index.html.erb"
	end
end