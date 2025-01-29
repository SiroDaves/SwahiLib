part of 'viewer_bloc.dart';

@freezed
sealed class ViewerEvent with _$ViewerEvent {
  const factory ViewerEvent.loadWord(Word word) = LoadWord;

  const factory ViewerEvent.likeWord(Word word) = LikeWord;

  const factory ViewerEvent.historyWord(Word word) = SaveHistoryWord;
}
