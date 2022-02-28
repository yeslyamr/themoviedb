import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/movies_api_client.dart';
import 'package:themoviedb/domain/api_client/search_api_client.dart';
import 'package:themoviedb/domain/entity/movie.dart';
import 'package:themoviedb/domain/entity/movie_response.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';
import 'package:tuple/tuple.dart';

class MovieListViewModel extends ChangeNotifier {
  final _moviesApiClient = MoviesApiClient();
  final _searchApiClient = SearchApiClient();
  final _movies = <Movie>[];

  MovieListViewModel({required this.category});
  List<Movie> get movies => List.unmodifiable(_movies);

  late String _locale = '';
  late int _currentPage;
  late int _totalPage;
  var _isLoadingInProgress = false;
  late DateFormat _dateFormat;
  String? _searchQuery;
  Timer? searchDebounce;
  final Tuple2 category;

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(locale);
    _resetList();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _movies.clear();
    await _loadNextPage();
  }

  Future<MovieResponse> _loadMovies(int nextPage, String locale) async {
    final query = _searchQuery;
    if (query == null) {
      return await _moviesApiClient.loadMoviesList(nextPage, _locale,
          category: category.item2);
    } else {
      return await _searchApiClient.searchMovie(nextPage, _locale, query);
    }
  }

  Future<void> _loadNextPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final moviesResponse = await _loadMovies(nextPage, _locale);
      _movies.addAll(moviesResponse.movies);
      _currentPage = moviesResponse.page;
      _totalPage = moviesResponse.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

  void showMovieAtIndex(int index) {
    if (index < movies.length - 1) return;
    _loadNextPage();
  }

  Future<void> searchMovie(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 500), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (searchQuery == _searchQuery) return;
      _searchQuery = searchQuery;
      await _resetList();
    });
  }
}
