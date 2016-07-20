class AboutController < ApplicationController

	def index
		render "pages/about.html.erb"
	end

	def evilla
		render "/about/evilla.html.erb"
	end

	def gomez
		render "/about/gomez.html.erb"
	end

	def guian
		render "/about/guian.html.erb"
	end

	def principe
		render "/about/principe.html.erb"
	end

end

