package com.learningstar.part1

object CallByStar extends App {
  def calledByValue(x: Long): Unit = {
    println(s"by value: $x")
    println(s"by value: $x")
  }

  def calledByName(x: => Long): Unit = {
    println(s"by name: $x")
    println(s"by name: $x")
  }

  calledByValue(System.nanoTime())
  calledByName(System.nanoTime())
}
