array = ["test", "a", "asadsa"]
puts array[2]

array2 = Array.new
array2[0] = "asdada"
array2[2] = "addd"
puts array2
puts array2[1] == nil ? "Yes" : "No"

array2.each {|x| print x, ' -- '}
puts ""

array2.each do |x|
  puts x
end
