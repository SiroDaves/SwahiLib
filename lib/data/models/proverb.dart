import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core/utils/constants/app_constants.dart';

part 'proverb.g.dart';

@Entity(tableName: AppConstants.proverbsTable)
@JsonSerializable()
class Proverb {
  @PrimaryKey()
  int? id;
  int? rid;
  String? title;
  String? synonyms;
  String? meaning;
  int? views;
  int? likes;
  bool? liked;
  String? createdAt;
  String? updatedAt;

  Proverb({
    this.id,
    this.rid,
    this.title,
    this.synonyms,
    this.meaning,
    this.views,
    this.likes,
    this.liked,
    this.createdAt,
    this.updatedAt,
  });

  factory Proverb.fromJson(Map<String, dynamic> json) => _$ProverbFromJson(json);

  Map<String, dynamic> toJson() => _$ProverbToJson(this);
}
