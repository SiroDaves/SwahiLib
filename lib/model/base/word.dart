import 'package:drift/drift.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../util/constants/utilities.dart';

class Word {
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

  List<Word> fromParse(List<ParseObject?> data) {
    return data
        .map(
          (object) => Word(
            objectId: object!.get<String>('objectId'),
            title: object.get<String>('title'),
            synonyms: object.get<String>('synonyms'),
            conjugation: object.get<String>('conjugation'),
            meaning: object.get<String>('meaning'),
            views: object.get<int>('views'),
            likes: object.get<int>('likes'),
            createdAt: dateToString(object.get<DateTime>('createdAt')!),
            updatedAt: dateToString(object.get<DateTime>('updatedAt')!),
          ),
        )
        .toList();
  }

  factory Word.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Word(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}objectId'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      synonyms: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}synonyms'])!,
      meaning: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meaning'])!,
      conjugation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}conjugation'])!,
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
