import '../../configuration/configuration.dart';
import '../entity/movie_response.dart';
import 'network_client.dart';

class SearchApiClient {
  final _networkClient = NetworkClient();

  Future<MovieResponse> searchMovie(
      int page, String locale, String query) async {
    return _networkClient.get(
        path: '/search/movie',
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final response = MovieResponse.fromJson(jsonMap);
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
