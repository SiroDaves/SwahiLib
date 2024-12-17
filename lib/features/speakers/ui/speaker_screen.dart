import 'package:flutter/material.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/widgets/features/session_item.dart';

class SpeakerScreen extends StatelessWidget {
  final Speaker speaker;
  final List<Session> sessions;
  final List<Room> rooms;

  const SpeakerScreen({
    super.key,
    required this.speaker,
    required this.sessions,
    required this.rooms,
  });

  @override
  Widget build(BuildContext context) {
    final speakerSessions = sessions
        .where((session) =>
            session.speakerNames?.contains(speaker.firstName!) ?? false)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${speaker.firstName} ${speaker.lastName}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _SpeakerImage(profilePicUrl: speaker.profilePic),
                    const SizedBox(height: 16),
                    Text(
                      speaker.tagLine ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      speaker.bio ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sessions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              if (speakerSessions.isEmpty)
                const Center(
                  child: Text(
                    'No sessions available for this speaker.',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: speakerSessions.length,
                  itemBuilder: (context, index) {
                    return SessionItem(
                      session: speakerSessions[index],
                      rooms: rooms,
                    );
                  },
                ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpeakerImage extends StatelessWidget {
  final String? profilePicUrl;

  const _SpeakerImage({required this.profilePicUrl});

  @override
  Widget build(BuildContext context) {
    var defaultPic = Image.asset(
      AppAssets.dcugIcon,
      fit: BoxFit.cover,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: profilePicUrl != null
          ? Image.network(
              profilePicUrl!,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) => defaultPic,
            )
          : defaultPic,
    );
  }
}
