package com.learningstar.advanced

import scala.collection.immutable.{AbstractSeq, LinearSeq}

object AdvancedPatternMatching extends App {
  private val numbers = List(1)
  private val description = numbers match
    case head :: Nil => s"The only one element is $head"
    case _           => "Unknown"
  println(description)

  class Person(val name: String, val age: Int, val flyHour: Int)
  object Person {
    def unapply(person: Person): Option[(String, Int, Int)] =
      if person.age < 21 then None
      else Some((person.name, person.age, person.flyHour))

    def unapply(arg: Int): Option[(String, String)] =
      val ageStatus = if arg < 21 then "junior" else "senior"
      val proStatus = if arg < 50 then "beginner" else "pro"
      Some((ageStatus, proStatus))
  }

  private val bob = new Person(name = "Bob", age = 20, flyHour = 70)
  private val greeting = bob match
    case Person(name, age, flyHour) =>
      s"Hi, my name is $name, and my age is $age, flyHour: $flyHour."
    case _ => "Unknown"
  private val legalStatus = bob.age match
    case Person(ageStatus, _) => s"My legal status is $ageStatus"
  private val proStatus = bob.flyHour match
    case Person(_, proStatus) => s"My legal status is $proStatus"
  println(greeting)
  println(legalStatus)
  println(proStatus)

  private object even {
    def unapply(arg: Int): Boolean = arg % 2 == 0
  }
  private object singleDigit {
    def unapply(arg: Int): Boolean = arg > -10 && arg < 10
  }
  private val n: Int = 48
  private val mathProperty = n match
    case singleDigit() => "single digit"
    case even()        => "even number"
    case _             => "unknown"
  println(mathProperty)
}
