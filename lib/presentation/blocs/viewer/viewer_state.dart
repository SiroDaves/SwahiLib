part of 'viewer_bloc.dart';

@freezed
class ViewerState with _$ViewerState {
  const factory ViewerState.initial() = _ViewerState;

  const factory ViewerState.loaded(
    List<String> meanings,
    List<String> synonyms,
  ) = ViewerLoadedState;

  const factory ViewerState.progress() = ViewerProgressState;

  const factory ViewerState.success() = ViewerSuccessState;

  const factory ViewerState.liked(bool liked) = ViewerLikedState;

  const factory ViewerState.history() = ViewerHistoryState;

  const factory ViewerState.failure(String feedback) = ViewerFailureState;
}
