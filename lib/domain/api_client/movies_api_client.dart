import 'package:themoviedb/configuration/configuration.dart';
import 'package:themoviedb/domain/api_client/network_client.dart';
import 'package:themoviedb/domain/entity/movie_details.dart';
import 'package:themoviedb/domain/entity/popular_movie_response.dart';

class MoviesApiClient {
  final _networkClient = NetworkClient();

  Future<PopularMovieResponse> popularMovies(int page, String locale) async {
    return _networkClient.get(
        path: '/movie/popular',
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final response = PopularMovieResponse.fromJson(jsonMap);
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
