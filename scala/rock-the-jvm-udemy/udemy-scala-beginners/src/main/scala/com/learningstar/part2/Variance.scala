package com.learningstar.part2

abstract class MyList[+A] {
  def head: A
  def tail: MyList[A]
  def isEmpty: Boolean
  def add[B >: A](element: B): MyList[B]
  def printElements: String

  override def toString: String = s"[$printElements]"
}

case object Empty extends MyList[Nothing] {
  override def head: Nothing = throw new NoSuchElementException()

  override def tail: MyList[Nothing] = throw new NoSuchElementException()

  override def isEmpty: Boolean = true

  override def add[B >: Nothing](element: B): MyList[B] = Cons(element, Empty)

  override def printElements: String = ""
}

case class Cons[+A](h: A, t: MyList[A]) extends MyList[A] {
  override def head: A = h

  override def tail: MyList[A] = t

  override def isEmpty: Boolean = false

  override def add[B >: A](element: B): MyList[B] = Cons(element, this)

  override def printElements: String = {
    if (t.isEmpty) s"$h"
    else s"$h ${t.printElements}"
  }
}

sealed abstract class Animal {
  def name: String
  def food: String
  def printMe(): Unit = println(s"I'm $name and I eat $food")
}

class Lion extends Animal {
  override def name: String = "Lion King"

  override def food: String = "Anything"
}

class Zebra extends Animal {
  override def name: String = "Zebra"

  override def food: String = "Grass"
}

object Variance extends App {
  val a: MyList[Lion] = Cons(new Lion, Cons(new Lion, Empty))
  val b: MyList[Animal] = Cons(new Lion, Cons(new Zebra, Empty))
  val c = a.add(new Zebra)
  println(a.printElements)
  println(c.printElements)
  println(b.printElements)
}
