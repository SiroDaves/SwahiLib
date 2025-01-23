part of 'viewer_bloc.dart';

@freezed
sealed class ViewerEvent with _$ViewerEvent {
  const factory ViewerEvent.loadWord(Word word) = LoadWord;

  const factory ViewerEvent.likeWord(Word word) = LikeWord;

  const factory ViewerEvent.historyWord(Word word) = SaveHistoryWord;

  const factory ViewerEvent.loadIdiom(Idiom idiom) = LoadIdiom;

  const factory ViewerEvent.likeIdiom(Idiom idiom) = LikeIdiom;

  const factory ViewerEvent.historyIdiom(Idiom idiom) = SaveHistoryIdiom;
  
  const factory ViewerEvent.loadProverb(Proverb proverb) = LoadProverb;

  const factory ViewerEvent.likeProverb(Proverb proverb) = LikeProverb;

  const factory ViewerEvent.historyProverb(Proverb proverb) =
      SaveHistoryProverb;

  const factory ViewerEvent.loadSaying(Saying saying) = LoadSaying;

  const factory ViewerEvent.likeSaying(Saying saying) = LikeSaying;

  const factory ViewerEvent.historySaying(Saying saying) = SaveHistorySaying;
}
