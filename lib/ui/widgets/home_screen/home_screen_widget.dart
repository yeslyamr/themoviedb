import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/domain/services/movies_tvshows_list_service.dart';
import 'package:themoviedb/ui/widgets/movie_list/movie_list_model.dart';

import 'horizontal_movie_list_widget.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final _movieTvshowListService = MoviesTvShowsListService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _movieTvshowListService.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return ChangeNotifierProvider(
              create: (_) => MovieListViewModel(
                    category: _movieTvshowListService.categories[index],
                  ),
              child: HorizontalMovieListWidget(
                category: _movieTvshowListService.categories[index],
              ));
        });
  }
}
