#!/usr/bin/env ruby

puts "Tom".concat(" Hanks")

name = "John"
name << " Doe"
puts name

name = "Tom"
name += " Hana"
puts name

city = "Jakarta"
puts city.upcase()
puts city
puts '-----------------------------'
puts city.upcase!() # this will change city variable's value
puts city
puts city.upcase!() == nil ? "Nil" : "" # this will return nil as nothing happens

puts city.reverse()

name = "John"
crypto = "SHA"
bit = 256

# string interpolation
puts "#{name} like playing #{crypto}-#{bit} game"
