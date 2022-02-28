import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/ui/widgets/auth/auth_model.dart';
import 'package:themoviedb/ui/widgets/auth/auth_widget.dart';
import 'package:themoviedb/ui/widgets/loader_screen/loader_widget.dart';
import 'package:themoviedb/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:themoviedb/ui/widgets/movie_details/movie_details_model.dart';
import 'package:themoviedb/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:themoviedb/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:tuple/tuple.dart';

import '../widgets/movie_list/movie_list_model.dart';

abstract class MainNavigationRouteNames {
  static const loaderWidget = '/';
  static const auth = '/auth';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details';
  static const moviesList = '/main_screen/movie_list';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget: (context) => LoaderWidget.create(),
    MainNavigationRouteNames.mainScreen: (context) => const MainScreenWidget(),
    MainNavigationRouteNames.auth: (context) => ChangeNotifierProvider(
          create: (_) => AuthModel(),
          child: const AuthWidget(),
        ),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => MovieDetailsModel(movieId: movieId),
            child: const MovieDetailsWidget(),
          ),
        );
      case MainNavigationRouteNames.moviesList:
        final arguments = settings.arguments;
        final category = arguments is Tuple2 ? arguments : const Tuple2('','');
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (_) => MovieListViewModel(category: category),
                  child: const MovieListWidget(),
                ));
      default:
        const widget = Text('Navigation Error');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
