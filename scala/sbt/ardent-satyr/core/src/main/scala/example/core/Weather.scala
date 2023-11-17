package example.core

import sttp.client4.httpclient.HttpClientSyncBackend
import sttp.client4.{Response, UriContext, quickRequest}

object Weather {
  def tempWeather() = {
    val backend = HttpClientSyncBackend()
    val response: Response[String] = quickRequest
      .get(uri"https://api.open-meteo.com/v1/forecast?latitude=40.7143&longitude=-74.006&current_weather=true")
      .send(backend)
    val json = ujson.read(response.body)
    json.obj("current_weather")("temperature").num
  }
}
