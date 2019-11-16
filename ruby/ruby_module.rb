module StringHelper
  class StringMaker
    def initialize(text)
      @text = text
    end

    def getText
      @text
    end

    def setText=(text)
      @text = text
    end

    def printString
      puts @text
    end
  end

  class StringCounter
    @@count = 0
    def initialize
      @@count += 1
    end

    def self.getCount
      @@count
    end
  end
end

module Utility
  def printMe
    puts "Hahaha!!!"
  end

  def printSum(a, b)
    puts (a + b)
  end
end

module BigFamily
  class BigClass
    include Utility
  end
end


test1 = StringHelper::StringCounter.new
test2 = StringHelper::StringCounter.new
puts StringHelper::StringCounter.getCount

test3 = StringHelper::StringMaker.new("Josh!!")
puts test3.printString
test3.setText="Groban!!"
puts test3.printString

test4 = BigFamily::BigClass.new
test4.printSum(4, 6)
