import 'package:drift/drift.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../util/constants/utilities.dart';

class Saying {
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

  List<Saying> fromParse(List<ParseObject?> data) {
    return data
        .map(
          (object) => Saying(
            objectId: object!.get<String>('objectId'),
            title: object.get<String>('title'),
            meaning: object.get<String>('meaning'),
            views: object.get<int>('views'),
            likes: object.get<int>('likes'),
            createdAt: dateToString(object.get<DateTime>('createdAt')!),
            updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
          ),
        )
        .toList();
  }

  factory Saying.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Saying(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}objectId'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      meaning: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meaning'])!,
      views: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}views'])!,
      likes: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}likes'])!,
      liked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}liked'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
}
