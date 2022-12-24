package com.learningstar.part2

import scala.annotation.tailrec

object HOF:
  @main def main(): Unit =
    @tailrec
    def nTimes(f: Int => Int, n: Int, x: Int): Int =
      if n <= 0 then x
      else nTimes(f, n - 1, f(x))

    def plusOne(x: Int): Int = x + 1
    def multiplyTwo(x: Int): Int = x * 2

    def nTimesBetter(f: Int => Int, n: Int): Int => Int = (x: Int) => nTimes(f, n, x)

    def nTimesCurry(f: Int => Int, n: Int)(x: Int): Int = nTimes(f, n, x)

    val plus10 = nTimesBetter(plusOne, 99999999)
    val multipleSth = nTimesCurry(multiplyTwo, 10)
    println(nTimes(plusOne, 10, 0))
    println(plus10(100))
    println(multipleSth(1))