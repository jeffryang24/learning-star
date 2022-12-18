package com.learningstar.part2

abstract class MyList[+A] {
  def head: A
  def tail: MyList[A]
  def isEmpty: Boolean
  def add[B >: A](element: B): MyList[B]
  def printElements: String
  def map[B](transformer: MyTransformer[A, B]): MyList[B]
  def flatMap[B](transformer: MyTransformer[A, MyList[B]]): MyList[B]
  def filter(predicate: MyPredicate[A]): MyList[A]
  def ++[B >: A](list: MyList[B]): MyList[B]

  override def toString: String = s"[$printElements]"
}

case object Empty extends MyList[Nothing] {
  override def head: Nothing = throw new NoSuchElementException()

  override def tail: MyList[Nothing] = throw new NoSuchElementException()

  override def isEmpty: Boolean = true

  override def add[B >: Nothing](element: B): MyList[B] = Cons(element, Empty)

  override def printElements: String = ""

  override def map[B](transformer: MyTransformer[Nothing, B]): MyList[B] = Empty

  override def flatMap[B](transformer: MyTransformer[Nothing, MyList[B]]): MyList[B] = Empty

  override def filter(predicate: MyPredicate[Nothing]): MyList[Nothing] = Empty

  override def ++[B >: Nothing](list: MyList[B]): MyList[B] = list
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

  override def map[B](transformer: MyTransformer[A, B]): MyList[B] = {
    Cons(transformer.transform(h), t.map(transformer))
  }

  override def flatMap[B](transformer: MyTransformer[A, MyList[B]]): MyList[B] = {
    transformer.transform(h) ++ t.flatMap(transformer)
  }

  override def filter(predicate: MyPredicate[A]): MyList[A] = {
    if (predicate.test(head)) Cons(h, t.filter(predicate))
    else t.filter(predicate)
  }

  override def ++[B >: A](list: MyList[B]): MyList[B] = {
    Cons(h, t ++ list)
  }
}

trait MyPredicate[-T] {
  def test(element: T): Boolean
}

trait MyTransformer[-A, +B] {
  def transform(element: A): B
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

  val d: MyList[Int] = Cons(1, Cons(2, Cons(3, Empty)))
  val e: MyList[Int] = Cons(4, Cons(5, Cons(6, Empty)))
  println(d.map(el => el * 2)) // Converted to lambda (single abstract method)
  println(d.filter(el => el % 2 == 0)) // Converted to lambda (single abstract method)
  println(d.map(new MyTransformer[Int, Int] {
    override def transform(element: Int): Int = element * 10
  }))
  println(d ++ e)
  println(d.flatMap(el => Cons(el + 1, Empty)))
}
