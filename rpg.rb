
puts "Enter Your Name, Warrior:"
  name = gets.chomp

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
