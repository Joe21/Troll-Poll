class HostsController < ApplicationController

	def home
		# Ensure that the hosts are sorted by ID to match the chart labels
		hosts = Host.all.sort! { |a,b| a.id <=> b.id }

		# Create the warhead
		warhead = []
		hosts.each do |host|
			warhead << host.votes
		end

		respond_to do |format|
			format.html
			format.json { render :json => warhead.to_json }
		end
	end

	def voting_booth
		@hosts = Host.all.sort! { |a,b| a.id <=> b.id }
	end

	def vote
		host = Host.find(params[:id])

		# Check to see if James receives a vote
		if host.name == "James Kincaid"

			# Increment James' vote
			host.increment(:votes)
			host.save

			# Identify all the other hosts
			jeff = Host.find(2)
			davis = Host.find(3)
			marc = Host.find(4)

			good_hosts = []
			good_hosts << jeff
			good_hosts << davis
			good_hosts << marc

			# Apply a random bonus to the good hosts
			bonus = [0,1,2,3]
			good_hosts.each do |good_host|
				good_host.votes += bonus.sample
				good_host.save
			end

		else
			host.increment(:votes)
			host.save
		end

		redirect_to root_path
	end

	# Strong params for User model
	private

	def hosts_params
		params.require(:host).permit(:name, :title, :image, :votes)
	end

end