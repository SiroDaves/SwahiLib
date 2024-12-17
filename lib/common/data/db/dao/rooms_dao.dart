import 'package:floor/floor.dart';

import '../../../utils/constants/app_constants.dart';
import '../../models/room.dart';

@dao
abstract class RoomsDao {
  @Query('SELECT * FROM ${AppConstants.roomsTable} WHERE id = :id')
  Future<Room?> findRoomById(int id);

  @Query('SELECT * FROM ${AppConstants.roomsTable}')
  Future<List<Room>> fetchRooms();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertRoom(Room room);

  @Query("DELETE FROM ${AppConstants.roomsTable}")
  Future<void> deleteAllRooms();
}
