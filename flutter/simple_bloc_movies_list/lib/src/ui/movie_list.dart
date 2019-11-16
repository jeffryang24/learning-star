import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';
import '../blocs/movie_detail_bloc_provider.dart';

import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  final String title;

  MovieList({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieListState();
  }
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: InkResponse(
            enableFeedback: true,
            child: Image.network(
              'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
              fit: BoxFit.cover,
            ),
            onTap: () => this.openDetailPage(snapshot.data, index),
          ),
        );
      },
    );
  }

  void openDetailPage(ItemModel data, int index) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) {
          var _item = data.results[index];
          return MovieDetailBlocProvider(
            child: MovieDetail(
              title: _item.title,
              posterUrl: _item.backdropPath,
              description: _item.overview,
              releaseDate: _item.releaseDate,
              voteAverage: _item.voteAverage,
              movieId: _item.id,
            ),
          );
        }
      )
    );
  }
}
