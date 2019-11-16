score = 'B';

case(score)
  when 'A', 'A-'
    puts "Wow!!"

  when 'B+', 'B', 'B-'
    puts "Ok!!"

  when 'C'
    puts "Bad!"

  else
    puts "Unknown"
end

score = 500

case(score)
  when 100..400
    puts "Good"

  when 401..600
    puts "Well Done!!"

  else
    puts "El Macho"
end
