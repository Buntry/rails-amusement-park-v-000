class Ride < ActiveRecord::Base
	belongs_to :attraction
	belongs_to :user
	
	
	def enough_tickets?
		user.tickets >= attraction.tickets
	end
	
	def tall_enough?
		user.height >= attraction.min_height
	end
	
	def take_ride_msg
		probs = ['Sorry.']
		able = true
		
		unless enough_tickets?
			probs << " You do not have enough tickets for the #{attraction.name}."
			able = false
		end
		
		unless tall_enough?
			probs << " You are not tall enough to ride the #{attraction.name}."
			able = false
		end
		
		return probs.join unless able
		return "Thanks for riding the #{attraction.name}!"
	end
	
	def take_ride
		if enough_tickets? && tall_enough?
			new_happiness = user.happiness + attraction.happiness_rating
      new_nausea = user.nausea + attraction.nausea_rating
      new_tickets =  user.tickets - attraction.tickets

      user.update!(happiness: new_happiness)
      user.update!(nausea: new_nausea)
      user.update!(tickets: new_tickets)
			user.save
		end
		
		return take_ride_msg
	end
end
