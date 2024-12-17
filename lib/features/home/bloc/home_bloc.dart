import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/data/models/models.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/repository/db/database_repository.dart';
import '../../../core/di/injectable.dart';
import '../domain/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const _HomeState()) {
    on<FetchOnlineData>(_onFetchOnlineData);
    on<FetchLocalData>(_onFetchLocalData);
  }

  final _homeRepo = HomeRepository();
  final _dbRepo = getIt<DatabaseRepository>();

  void _onFetchOnlineData(
    FetchOnlineData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeProgressState());
    var resp = await _homeRepo.getSessions();
    try {
      switch (resp.statusCode) {
        case 200:
          emit(const HomeFetchedOnlineState(true));
          break;

        default:
          emit(const HomeFetchedOnlineState(false));
          break;
      }
    } catch (e) {
      logger("Error log: $e");
      emit(const HomeFetchedOnlineState(false));
    }
  }

  void _onFetchLocalData(
    FetchLocalData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeProgressState());
    List<Bookmark> bookmarks = [];
    List<Room> rooms = [];
    List<Speaker> speakers = [];
    List<Session> sessions = [];

    try {
      bookmarks = await _dbRepo.fetchBookmarks();
      rooms = await _dbRepo.fetchRooms();
      sessions = await _dbRepo.fetchSessions();
      speakers = await _dbRepo.fetchSpeakers();
      emit(HomeFetchedLocalState(bookmarks, rooms, speakers, sessions));
    } catch (e) {
      logger("Error log: $e");
      emit(HomeFetchedLocalState(bookmarks, rooms, speakers, sessions));
    }
  }

}
