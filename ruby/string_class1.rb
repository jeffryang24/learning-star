#!/usr/bin/env ruby
# class1

name = 'John Doe\'s Girlfriend'
puts name
puts name.class

address = "John's Anderson Street"
puts address
puts address.class

# Short comment

=begin
Multiline comment
Yeah!!
=end

city = "Indonesia"
state = "Jakarta"

$, = "\n"
$\ = "\n"
print city, state   # same as puts city; puts state
