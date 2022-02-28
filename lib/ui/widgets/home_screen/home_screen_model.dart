import 'package:flutter/material.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';
import 'package:tuple/tuple.dart';

class HomeScreenModel extends ChangeNotifier {

  void openMovieListWidget(BuildContext context, {required Tuple2 category}) {
    Navigator.of(context).pushNamed(MainNavigationRouteNames.moviesList , arguments: category);
  }
}
