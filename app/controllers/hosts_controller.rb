class HostsController < ApplicationController

	def home
	end

	def poll
	end

	def vote_james
	end

	def vote_jeff
	end

	def vote_davis
	end

	def vote_marc
	end

	# Strong params for User model
	private

	def hosts_params
		params.require(:host).permit(:name, :title, :image, :votes)
	end

end