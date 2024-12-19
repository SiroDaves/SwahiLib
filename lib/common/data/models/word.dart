import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/constants/app_constants.dart';

part 'word.g.dart';

@Entity(tableName: AppConstants.wordsTable)
@JsonSerializable()
class Word {
  @PrimaryKey()
  int? id;
  String? objectId;
  String? title;
  String? synonyms;
  String? meaning;
  String? conjugation;
  int? views;
  int? likes;
  bool? liked;
  String? createdAt;
  String? updatedAt;

  Word({
    this.id,
    this.objectId,
    this.title,
    this.synonyms,
    this.meaning,
    this.conjugation,
    this.views,
    this.likes,
    this.liked,
    this.createdAt,
    this.updatedAt,
  });

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}
