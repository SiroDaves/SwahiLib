import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core/utils/constants/app_constants.dart';

part 'idiom.g.dart';

@Entity(tableName: AppConstants.idiomsTable)
@JsonSerializable()
class Idiom {
  @PrimaryKey()
  int? id;
  int? rid;
  String? title;
  String? meaning;
  int? views;
  int? likes;
  bool? liked;
  String? createdAt;
  String? updatedAt;

  Idiom({
    this.id,
    this.rid,
    this.title,
    this.meaning,
    this.views,
    this.likes,
    this.liked,
    this.createdAt,
    this.updatedAt,
  });

  factory Idiom.fromJson(Map<String, dynamic> json) => _$IdiomFromJson(json);

  Map<String, dynamic> toJson() => _$IdiomToJson(this);
}
