#rpg.rb

baddies = [
  {name => "Newt", health => 10},
  {name => "George", health => 10},
  {name => "Reagan", health => 10},
  {name => "Bush", health => 10},
  {name => "Gore", health => 10},
  {name => "Koch", health => 10},
  {name => "Anderson" ,health => 10},
  {name => "Palin",health => 10},
  {name => "Nixon",health => 10},
  ]

hero = { name => "Dried Blood Hero", health => 10 }

def hero_attack( opponent ) do

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


def baddie_attack(opponent) do
  chance = rand
  if chance > .4
    points = rand(1..3)
    puts "The #{opponent[name]} attacks you for #{opponent[name]} points."
    hero[health] = hero[health] - points
    puts hero[name] + ": " + hero[health] + " health points."
    puts opponent[name] + ": " + opponent[health] + " health points."
    if hero[health] <= 0
      hero_death
    end
  else
    puts "The #{opponent[name]} tried to attack you but misses!"
    puts hero[name] + ": " + hero[health] + " health points."
    puts opponent[name] + ": " + opponent[health] + " health points."
  end
end


def hero_death do
  puts "Sorry the blood has run dry. Better luck next time!"
  break
end

# main
puts "Enter Your Name, Warrior: "
  hero[name] = gets.chomp
