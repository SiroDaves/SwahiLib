import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../../../common/data/models/models.dart';
import '../../../common/repository/db/database_repository.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/date_util.dart';
import '../../../core/di/injectable.dart';
import '../data/home_client.dart';

class HomeRepository {
  final _homeClient = HomeClient();

  /// Fetch all data
  Future<Response> getSessions() async {
    var resp = await _homeClient.getSessions();
    switch (resp.statusCode) {
      case 200:
        final dbRepo = getIt<DatabaseRepository>();
        var sessionaize = jsonDecode(resp.body);
        try {
          dbRepo.removeAllRooms();
          dbRepo.removeAllSessions();
          dbRepo.removeAllSpeakers();
        } catch (e) {
          logger('Error while removing db tables: $e');
        }

        //save data to db if found
        for (final room in sessionaize['rooms']) {
          try {
            dbRepo.saveRoom(
              Room(
                id: int.tryParse(room['id'].toString()),
                name: room['name'],
                sort: int.tryParse(room['sort'].toString()),
                createdAt: getIso8601Date(),
              ),
            );
          } catch (e) {
            logger('Error while adding a room to the db: $e');
          }
        }

        for (final session in sessionaize['sessions']) {
          try {
            String sessionId = session['id'].toString();

            dbRepo.saveSession(
              Session(
                id: int.tryParse(sessionId),
                title: session['title'],
                description: session['description'],
                startsAt: session['startsAt'],
                endsAt: session['endsAt'],
                speakerIds: session['speakers'].toString(),
                speakerNames: await findSpeakerName(
                  sessionId,
                  sessionaize['speakers'],
                ),
                categories: session['categories'].toString(),
                room: int.tryParse(session['roomId'].toString()),
                createdAt: getIso8601Date(),
              ),
            );
          } catch (e) {
            logger('Error while adding a room to the db: $e');
          }
        }

        for (final speaker in sessionaize['speakers']) {
          try {
            dbRepo.saveSpeaker(
              Speaker(
                id: int.tryParse(speaker['id'].toString()),
                firstName: speaker['firstName'],
                lastName: speaker['lastName'],
                bio: speaker['bio'],
                tagLine: speaker['tagLine'],
                profilePic: speaker['profilePicture'],
                links: speaker['links'].toString(),
                sessions: speaker['sessions'].toString(),
                createdAt: getIso8601Date(),
              ),
            );
          } catch (e) {
            logger('Error while adding a speaker to the db: $e');
          }
        }
        break;
    }
    return resp;
  }

  Future<String> findSpeakerName(String session, dynamic speakers) async {
    String speakerName = '';
    for (final speaker in speakers) {
      try {
        if (speaker['sessions'].toString().contains(session)) {
          speakerName = speaker['fullName'];
          break;
        }
      } catch (e) {
        logger('Error finding the speaker name for session $session: $e');
      }
    }
    return speakerName;
  }
}
