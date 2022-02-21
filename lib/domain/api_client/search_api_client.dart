import '../../configuration/configuration.dart';
import '../entity/popular_movie_response.dart';
import 'network_client.dart';

class SearchApiClient {
  final _networkClient = NetworkClient();

  Future<PopularMovieResponse> searchMovie(
      int page, String locale, String query) async {
    return _networkClient.get(
        path: '/search/movie',
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final response = PopularMovieResponse.fromJson(jsonMap);
          return response;
        },
        parameters: {
          'api_key': Configuration.apiKey,
          'page': page.toString(),
          'language': locale,
          'query': query,
          'include_adult': true.toString(),
        });
  }
}
