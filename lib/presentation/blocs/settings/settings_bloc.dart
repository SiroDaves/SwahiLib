import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.dart';
part 'settings_state.dart';

part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const _SettingsState()) {
    on<SettingsInit>(_onInit);
  }

  Future<void> _onInit(
    SettingsInit event,
    Emitter<SettingsState> emit,
  ) async {
    emit(ProgressState());
    
    emit(LoadedState());
  }
}
