part of '../home_screen.dart';

class SessionsPreview extends StatelessWidget {
  final HomeScreenState parent;

  const SessionsPreview({required this.parent, super.key});

  @override
  Widget build(BuildContext context) {
    var widgetTitle = Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'SESSIONS ...',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ).expanded(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 18),
              backgroundColor: ThemeColors.primary),
          onPressed: () {
            Navigator.pushNamed(
              context,
              RouteNames.sessions,
            );
          },
          child: const Text('View All'),
        ),
      ],
    );
    final displayedRooms = parent.rooms.take(2).toList();
    List<Session> getSessionsForRoom(Room room) {
      return parent.sessions
          .where((session) => session.room == room.id)
          .toList();
    }

    return Container(
      margin: const EdgeInsets.all(Sizes.sm),
      child: Card(
        elevation: 4,
        color: ThemeColors.bgColorPrimary3(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.sm),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widgetTitle,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: displayedRooms
                    .map((room) => Expanded(
                          child: RoomCard(
                            room: room,
                            sessions: getSessionsForRoom(room),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final Room room;
  final List<Session> sessions;

  const RoomCard({super.key, required this.room, required this.sessions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: Center(
            child: Swiper(
              itemBuilder: (context, index) => _SessionInfo(
                session: sessions[index],
              ),
              autoplay: false,
              itemCount: 10, //sessions.length,
              itemWidth: (MediaQuery.of(context).size.height / 4) - 10,
              itemHeight: (MediaQuery.of(context).size.height / 4) - 10,
              layout: SwiperLayout.TINDER,
            ),
          ),
        ),
        Text(
          room.name ?? "Room",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _SessionInfo extends StatelessWidget {
  final Session session;

  const _SessionInfo({required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Sizes.sm),
          decoration: BoxDecoration(
            color: ThemeColors.primary,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ThemeColors.bgColorPrimary(context)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                session.title ?? 'Session Title' '...',
                maxLines: 3,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'By: ${session.speakerNames}',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'From: ${formatTime(session.startsAt!)}',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                'To: ${formatTime(session.endsAt!)}',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
