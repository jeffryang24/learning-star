grades = {"John" => 2.5, "Mary" => 5, "Aston" => 8}

puts grades['John']

grades.each do |k, v|
  puts "#{k} grade is #{v}"
end
