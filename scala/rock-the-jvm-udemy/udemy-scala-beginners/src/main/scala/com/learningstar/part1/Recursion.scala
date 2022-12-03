package com.learningstar.part1

import scala.annotation.tailrec

object Recursion extends App {
  def factorial(n: Int): Int = {
    if (n <= 1) then n
    else {
      println(s"Computing factorial of $n, first need to compute factorial(${n - 1})")
      val result = n * factorial(n - 1)
      println(s"Computed factorial of $n")
      result
    }
  }

  def anotherFactorial(n: Int): BigInt = {
    @tailrec
    def factorialHelper(x: Int, acc: BigInt): BigInt = {
      if (x == 1) then acc
      else factorialHelper(x - 1, x * acc)
    }

    factorialHelper(n, 1)
  }

//  println(factorial(10))
//  println(factorial(50000)) // Stack overflow
  println(anotherFactorial(2000))
}
