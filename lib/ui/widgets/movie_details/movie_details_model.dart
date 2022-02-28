import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/movies_api_client.dart';
import 'package:themoviedb/domain/entity/movie_details.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _moviesApiClient = MoviesApiClient();

  final int movieId;
  MovieDetails? _movieDetails;
  MovieDetails? get movieDetails => _movieDetails;
  String _locale = '';
  //  late DateFormat _dateFormat;

  MovieDetailsModel({required this.movieId});

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    // _dateFormat = DateFormat.yMMMMd(locale);
    await loadDetails();
  }

  Future<void> loadDetails() async {
    _movieDetails = await _moviesApiClient.movieDetails(movieId, _locale);
    notifyListeners();
  }
}
