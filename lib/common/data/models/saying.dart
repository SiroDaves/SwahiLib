import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/constants/app_constants.dart';

part 'saying.g.dart';

@Entity(tableName: AppConstants.sayingsTable)
@JsonSerializable()
class Saying {
  @PrimaryKey()
  int? id;
  String? objectId;
  String? title;
  String? meaning;
  int? views;
  int? likes;
  bool? liked;
  String? createdAt;
  String? updatedAt;

  Saying({
    this.id,
    this.objectId,
    this.title,
    this.meaning,
    this.views,
    this.likes,
    this.liked,
    this.createdAt,
    this.updatedAt,
  });

  factory Saying.fromJson(Map<String, dynamic> json) => _$SayingFromJson(json);

  Map<String, dynamic> toJson() => _$SayingToJson(this);
}
