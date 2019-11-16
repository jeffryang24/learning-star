# file1 = File.new("test.md", "w+")
# file1.syswrite("Yeah!! Finally Ruby is learned!\n")
# file1.puts("Hooray!!")
# file1.close

begin
  file2 = File.open("testt.md", "r")
  file2.each {|line| print line, '\n'}
rescue
  raise "File not found"
end

puts File.exist?('oop1.rb')
