class Document
  attr_accessor :name
  def initialize(doc_name)
    @name = doc_name
  end

  def set_name(new_name)
    @name = new_name
  end
end

doc1 = Document.new('test.txt')
puts doc1.name
doc1.set_name 'new_test.txt'
puts doc1.name

=begin
without using attr_accessor method
=end

class Shape
  def initialize(width, height)
    @width, @height = width, height
  end

  def getHeight
    @height
  end

  def getWidth
    @width
  end

  def setWidth=(width)
    @width = width
  end

  def setHeight=(height)
    @height = height
  end

  def IamGroot
    puts "I'm Groot!!! I'm Parent!"
  end

  def countArea
    puts "Parent Area!"
  end
end

class Triangle < Shape
  def initialize(base, high)
    @base, @high = base, high
  end

  def countArea
    @base * @high / 2
  end
end

class Rectangle < Shape
  def countArea
    @width * @height
  end
end


puts
puts

shape1 = Shape.new(2,3)
puts shape1.getWidth
shape1.setWidth = 55
puts shape1.getWidth

triangle1 = Triangle.new(2, 3)
puts triangle1.countArea

rect1 = Rectangle.new(3, 8)
puts rect1.countArea


