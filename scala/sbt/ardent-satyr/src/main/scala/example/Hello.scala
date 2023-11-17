package example

import example.core.Weather

object Hello extends App {
  println("Hello SBT!")
  private val temp = Weather.tempWeather()
  println(s"Hello world! Current temperature in New York is $temp C.")
}
