import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
// import 'package:dotenv/dotenv.dart' show load, env;

import '../models/item_model.dart';
import '../models/trailer_model.dart';

class MovieApiProvider {
  Client client = Client();
  // final String _apiKey = env['MOVIEDB_API_KEY'];
  final String _baseUrl = 'http://api.themoviedb.org/3/movie';
  final String _apiKey = '87d95f20312d61a1ff12cbf513fbec07';

  Future<ItemModel> fetchMovieList() async {
    final response = await client.get('${_baseUrl}/popular?api_key=${_apiKey}');

    if (response.statusCode == 200) {
      return ItemModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response = await client.get('${_baseUrl}/${movieId}/videos?api_key=${_apiKey}');

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}