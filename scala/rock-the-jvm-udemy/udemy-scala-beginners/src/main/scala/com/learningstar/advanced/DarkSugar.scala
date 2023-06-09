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
  val towards: Int --> String = ???
}
