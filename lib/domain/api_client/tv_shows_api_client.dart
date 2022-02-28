import 'package:themoviedb/domain/entity/tv_shows_response.dart';

import '../../configuration/configuration.dart';
import 'network_client.dart';

class TvShowsApiClient {
  final _networkClient = NetworkClient();

  Future<TvShowsResponse> loadTvShowsList(int page, String locale,
      {required String category}) async {
    return _networkClient.get(
        path: category,
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final response = TvShowsResponse.fromJson(jsonMap);
          return response;
        },
        parameters: {
          'api_key': Configuration.apiKey,
          'page': page.toString(),
          'language': locale,
        });
  }
}