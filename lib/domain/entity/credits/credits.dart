import 'package:json_annotation/json_annotation.dart';

import 'cast.dart';
import 'crew.dart';

part 'credits.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Credits {
  final List<Cast>? cast;
  final List<Crew>? crew;

  Credits({required this.cast, required this.crew});

  factory Credits.fromJson(Map<String, dynamic> json) {
    return _$CreditsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreditsToJson(this);
}
