package com.learningstar.introduction

object Expression extends App {
  var aVariable = 5
  val aWeirdValue = (aVariable = 3)
  val c = {
    require(aVariable < 10)
    aVariable
  }
  println(aWeirdValue)
  println(c)
}
