import 'package:json_annotation/json_annotation.dart';
import 'package:themoviedb/domain/entity/tv_show.dart';

part 'tv_shows_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TvShowsResponse {
  final int page;
  @JsonKey(name: 'results')
  final List<TvShow> movies;
  final int totalResults;
  final int totalPages;

  TvShowsResponse(this.page, this.movies, this.totalResults, this.totalPages);

  factory TvShowsResponse.fromJson(Map<String, dynamic> json) =>
      _$TvShowsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowsResponseToJson(this);
}
