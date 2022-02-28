// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_shows_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowsResponse _$TvShowsResponseFromJson(Map<String, dynamic> json) =>
    TvShowsResponse(
      json['page'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => TvShow.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_results'] as int,
      json['total_pages'] as int,
    );

Map<String, dynamic> _$TvShowsResponseToJson(TvShowsResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies.map((e) => e.toJson()).toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
