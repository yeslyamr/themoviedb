import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_screen_cast.dart';

import 'movie_details_main_info_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("the movie details"),
        ),
        body: ListView(
          children: const [
            MovieDetailsMainInfoWidget(),
            MovieDetailsScreenCastWidget(),
          ],
        ));
  }
}
