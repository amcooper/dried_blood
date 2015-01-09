#rpg.rb

baddies = [
  {"name" => "Newt", "health" => 10},
  {"name" => "George", "health" => 10},
  {"name" => "Reagan", "health" => 10},
  {"name" => "Bush", "health" => 10},
  {"name" => "Gore", "health" => 10},
  {"name" => "Koch", "health" => 10},
  {"name" => "Anderson" ,"health" => 10},
  {"name" => "Palin","health" => 10},
  {"name" => "Nixon","health" => 10},
  ]

max_health = 10
hero = { "name" => "Dried Blood Hero", "health" => max_health }

def hero_attack( hero, opponent )

	chance = rand() # Roll the dice
	# puts "Debug: chance = " + chance.to_s # Debugging line
  puts "You are on the attack!"

	# 20% chance of missing. If chance is between 20% and 100%, it's a hit; weaken the opponent.
	if chance > 0.2
		hit = rand(2..4)
    opponent["health"] = opponent["health"] - hit
    puts "You've landed it a hit! " + opponent["name"] + " loses " + hit.to_s + " points."
	else
    puts "Oh, no! You've missed!"
  end

	# Battle state report
	puts hero["name"] + ": " + hero["health"].to_s + " health points."

  if opponent["health"] < 0
    baddie_death( hero, opponent )
  else
  	puts opponent["name"] + ": " + opponent["health"].to_s + " health points."
  end

end


def baddie_attack( hero, opponent)
  chance = rand
  if chance > 0.4
    points = rand(1..3)
    puts "The #{opponent["name"]} attacks you for #{opponent["health"]} points."
    hero["health"] = hero["health"] - points
    puts hero["name"] + ": " + hero["health"].to_s + " health points."
    puts opponent["name"] + ": " + opponent["health"].to_s + " health points."
    if hero["health"] <= 0
      hero_death
    end
  else
    puts "The #{opponent["name"]} tried to attack you but misses!"
    puts hero["name"] + ": " + hero["health"].to_s + " health points."
    puts opponent["name"] + ": " + opponent["health"].to_s + " health points."
  end
end

def bury(baddies, index)
  baddies = baddies.delete_at(index)
end

def hero_death
  puts "Sorry the blood has run dry. Better luck next time!"
  # break
end

def baddie_death( hero, opponent )
  puts "Help build the community punk!"
  hero["health"] = max_health
end

def hero_run( hero, opponent )
  hero["health"] = hero["health"] - 2
  puts "You ran away from #{opponent["name"]}, but lost 2 health points!"
end

# main
puts "Enter Your Name, Warrior: "
  hero["name"] = gets.chomp
puts "Welcome, " + hero["name"] + ". Let the battle be joined!"

while baddies.length > 0
  n = rand(0..(baddies.length-1)) # Choose a baddie.
  puts baddies[n]["name"] + " attacks! Do you want to run or fight? (y | n)"
  isFighting = gets.chomp
  if (isFighting === "n")
    hero_run( hero, baddies[n] )
  else # isFighting === "y"
    while ( hero["health"] > 0 ) && ( baddies[n]["health"] > 0 )
      hero_attack( hero, baddies[n])
      if ( hero["health"] > 0 ) && ( baddies[n]["health"] > 0 )
        baddie_attack( hero, baddies[n])
      end
    end
  end
end
