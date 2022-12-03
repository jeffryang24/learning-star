package com.learningstar.part1

import scala.annotation.tailrec

object Function extends App {
  def getNumber: Int = 42
  def getAnotherNumber(): Int = 43

  def repeatFunction(aString: String, n: Int): String = {
    if (n == 1) then aString
    else aString + repeatFunction(aString, n - 1)
  }

  println(getNumber)
  println(getAnotherNumber())
  println(repeatFunction("asd", 5))
}
