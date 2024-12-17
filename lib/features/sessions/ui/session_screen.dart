import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/date_util.dart';
import '../../../common/widgets/features/session_item.dart';
import '../../../common/widgets/features/tag_item.dart';
import '../common/utils.dart';

class SessionScreen extends StatelessWidget {
  final Session session;
  final List<Session> sessions;
  final List<Room> rooms;

  const SessionScreen({
    super.key,
    required this.session,
    required this.sessions,
    required this.rooms,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Session Title
            Text(
              session.title ?? 'Untitled Session',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            [
              const Text(
                'With: ',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                session.speakerNames ?? 'Untitled Session',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ].toRow(
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            const SizedBox(height: 8),
            [
              const Text(
                'Time: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TagItem(
                tagText:
                    '${formatTime(session.startsAt!)} - ${formatTime(session.endsAt!)}',
              ),
            ].toRow(),
            const SizedBox(height: 8),
            [
              const Text(
                'Room: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TagItem(
                tagText: getRoomName(rooms, session.room!)!,
              ),
            ].toRow(),
            const SizedBox(height: 16),
            Text(
              session.description ?? 'No description available.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            if (sessions.isNotEmpty) ...[
              const Text(
                'Other Sessions going on now:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  return SessionItem(
                    session: sessions[index],
                    rooms: rooms,
                  );
                },
              ),
            ] else
              const Text(
                'No other sessions going on now.',
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
