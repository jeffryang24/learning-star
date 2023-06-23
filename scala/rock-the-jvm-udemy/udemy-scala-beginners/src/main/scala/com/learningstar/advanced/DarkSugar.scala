package com.learningstar.advanced

object DarkSugar extends App {
  trait Action {
    def act(x: Int): Int
  }

  abstract class Test {
    def implemented: Int = 23
    def f(a: Int): Int
  }

  class TeenGirl(name: String) {
    def `and then said`(gossip: String): Unit = println(s"$name said $gossip")
  }

  val action: Action = (x: Int) => 2
  val action2: Test = (a: Int) => a
  println(action2.f(3))
  println(1 :: 2 :: 3 :: Nil)
  val lily = new TeenGirl("Lily")
  lily `and then said` "Lala land"

  // Syntax sugar for infix type
  class -->[A, B]
  val towards: Int --> String = null

  // Infix type
  case class Or[A, B](a: A, b: B)
  val either = Or(2, "two")
  val humanDesc = either match
    case number Or string => s"$number is written as $string"
  println(humanDesc)

  // Decomposing sequences
  abstract class MyList[+A]:
    def head: A = ???
    def tail: MyList[A] = ???
  case object Empty extends MyList[Nothing]
  case class Cons[+A](override val head: A, override val tail: MyList[A]) extends MyList[A]
  object MyList {
    def unapplySeq[A](list: MyList[A]): Option[Seq[A]] =
      if (list == Empty) Some(Seq.empty)
      else unapplySeq(list.tail).map(list.head +: _)
  }
  val myList: MyList[Int] = Cons(1, Cons(2, Cons(3, Empty)))
  val decompose = myList match
    case MyList(1, 2, _*) => "starting with one and two"
    case _ => "something else"
  println(decompose)
}
