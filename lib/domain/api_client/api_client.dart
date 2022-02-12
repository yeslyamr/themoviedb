import 'dart:io';

import 'dart:convert';

import 'package:themoviedb/domain/entity/movie_details.dart';
import 'package:themoviedb/domain/entity/popular_movie_response.dart';

enum ApiClientExceptionType { network, auth, other }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrlOrig = 'https://image.tmdb.org/t/p/original';
  static const _imageUrlW500 = 'https://image.tmdb.org/t/p/w500';

  static const _apiKey = 'c0b7c23464f2ee4fc5d96e8182a9ade6';
  //c0b7c23464f2ee4fc5d96e8182a9ade6

  static String imageUrlW500(String path) =>  '$_imageUrlW500$path';

  static String imageUrlOrig(String path) => '$_imageUrlOrig$path';

  Future<String> auth({
    required String username,
    required String password,
  }) async {
    final token = await _makeToken();
    final validToken = await _validateUser(
        username: username, password: password, requestToken: token);
    final sessionId = await _makeSession(requestToken: validToken);
    return sessionId;
  }

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    }
    return uri;
  }

  Future<T> _get<T>(
      {required String path,
      required T Function(dynamic json) parser,
      Map<String, dynamic>? parameters}) async {
    final url = _makeUri(path, parameters);
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);

      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<T> _post<T>({
    required String path,
    required T Function(dynamic json) parser,
    required Map<String, dynamic>? bodyParameters,
    Map<String, dynamic>? urlParameters,
  }) async {
    try {
      final url = _makeUri(path, urlParameters);
      final request = await _client.postUrl(url);

      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(bodyParameters));

      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);

      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<PopularMovieResponse> popularMovies(int page, String locale) async {
    final result = _get(
        path: '/movie/popular',
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final response = PopularMovieResponse.fromJson(jsonMap);
          return response;
        },
        parameters: {
          'api_key': _apiKey,
          'page': page.toString(),
          'language': locale,
        });

    return result;
  }

  Future<PopularMovieResponse> searchMovie(
    int page,
    String locale,
    String query,
  ) async { 
    final result = _get(
        path: '/search/movie',
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final response = PopularMovieResponse.fromJson(jsonMap);
          return response;
        },
        parameters: {
          'api_key': _apiKey,
          'page': page.toString(),
          'language': locale,
          'query': query,
          'include_adult': true.toString(),
        });

    return result;
  }

  Future<MovieDetails> movieDetails(
    int movieId,
    String locale,
  ) async {
    final path = '/movie/$movieId';
    // ignore: prefer_function_declarations_over_variables
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieDetails.fromJson(jsonMap);
      return response;
    };
    final result = _get<MovieDetails>(path: path, parser: parser, parameters: {
      'append_to_response': 'credits',
      'api_key': _apiKey,
      'language': locale,
    });

    return result;
  }

  Future<String> _makeToken() async {
    final result = _get(
        path: '/authentication/token/new',
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final token = jsonMap['request_token'] as String;
          return token;
        },
        parameters: {'api_key': _apiKey});
    return result;
  }

  Future<String> _makeSession({
    required String requestToken,
  }) async {
    final result = _post(
        path: '/authentication/session/new',
        parser: (dynamic json) {
          final jsonMap = json as Map<String, dynamic>;
          final sessionId = jsonMap['session_id'] as String;
          return sessionId;
        },
        urlParameters: {'api_key': _apiKey},
        bodyParameters: <String, dynamic>{'request_token': requestToken});
    return result;
  }

  Future<String> _validateUser({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    final result = _post(
      path: '/authentication/token/validate_with_login',
      parser: (dynamic json) {
        final jsonMap = json as Map<String, dynamic>;
        final token = jsonMap['request_token'] as String;
        return token;
      },
      bodyParameters: <String, dynamic>{
        'username': username,
        'password': password,
        'request_token': requestToken
      },
      urlParameters: {'api_key': _apiKey},
    );
    return result;
  }
}

void _validateResponse(HttpClientResponse response, Map<String, dynamic> json) {
  if (response.statusCode == 401) {
    final dynamic status = json['status_code'];
    final code = status is int ? status : 0;
    switch (code) {
      case 30:
        throw ApiClientException(ApiClientExceptionType.auth);
      default:
        throw ApiClientException(ApiClientExceptionType.other);
    }
  }
}

extension HttpClientResponseJsonDecoder on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}

/*
30 - wrong username or password
7 wrong api key
33 invalid request token
 */
