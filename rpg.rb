#rpg.rb

def hero_attack( opponent )

	chance = rand() # Roll the dice
	puts "Debug: chance = " + chance # Debugging line

	# 20% chance of missing. If chance is between 20% and 100%, it's a hit; weaken the opponent.
	if chance > 0.2
		opponent[health] = opponent[health] - rand(2..4)
	end

	# Battle state report
	puts hero[name] + ": " + hero[health] + " health points."
	puts opponent[name] + ": " + opponent[health] + " health points."

end
