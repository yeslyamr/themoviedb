import 'package:themoviedb/configuration/configuration.dart';
import 'package:themoviedb/domain/api_client/network_client.dart';
import 'package:themoviedb/domain/entity/movie_details.dart';
import 'package:themoviedb/domain/entity/movie_response.dart';

class MoviesApiClient {
  final _networkClient = NetworkClient();

  Future<MovieResponse> loadMoviesList(int page, String locale,
      {required String category}) async {
    return _networkClient.get(
        path: category,
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final response = MovieResponse.fromJson(jsonMap);
          return response;
        },
        parameters: {
          'api_key': Configuration.apiKey,
          'page': page.toString(),
          'language': locale,
        });
  }


  Future<MovieResponse> nowPlayingMovies(int page, String locale) async {
    return _networkClient.get(
        path: '/movie/now_playing',
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final response = MovieResponse.fromJson(jsonMap);
          return response;
        },
        parameters: {
          'api_key': Configuration.apiKey,
          'page': page.toString(),
          'language': locale,
        });
  }

  Future<MovieResponse> upcomingMovies(int page, String locale) async {
    return _networkClient.get(
        path: '/movie/upcoming',
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final response = MovieResponse.fromJson(jsonMap);
          return response;
        },
        parameters: {
          'api_key': Configuration.apiKey,
          'page': page.toString(),
          'language': locale,
        });
  }

  Future<MovieResponse> topRatedMovies(int page, String locale) async {
    return _networkClient.get(
        path: '/movie/top_rated',
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final response = MovieResponse.fromJson(jsonMap);
          return response;
        },
        parameters: {
          'api_key': Configuration.apiKey,
          'page': page.toString(),
          'language': locale,
        });
  }

  Future<MovieDetails> movieDetails(int movieId, String locale) async {
    return _networkClient.get<MovieDetails>(
        path: '/movie/$movieId',
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final response = MovieDetails.fromJson(jsonMap);
          return response;
        },
        parameters: {
          'append_to_response': 'credits',
          'api_key': Configuration.apiKey,
          'language': locale,
        });
  }
}
