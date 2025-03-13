part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _SettingsState;

  const factory SettingsState.loaded() = LoadedState;

  const factory SettingsState.progress() = ProgressState;

  const factory SettingsState.success() = SuccessState;

  const factory SettingsState.failure(String feedback) = FailureState;
}
