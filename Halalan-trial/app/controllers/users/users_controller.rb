module Users
	class UsersController < ApplicationController
		before_action :authenticate_user!
		def index
			@positions = Position.all
	      	@candidates = Candidate.all 
	      	@votes = Vote.all
	      	render "pages/profile.html.erb"
		end
	end
end
