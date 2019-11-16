import 'dart:io';
import 'dart:convert';

Future<String> getDogImageUrl() async {
  HttpClient httpCLient = HttpClient();

  try {
    Uri dogCeoUrl = Uri.https('dog.ceo', '/api/breeds/image/random');
    HttpClientRequest request = await httpCLient.getUrl(dogCeoUrl);
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();

    return json.decode(responseBody)['message'];
  } catch (ex) {
    print(ex);
    return '';
  }
}
