part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _HomeState;

  const factory HomeState.loaded() = HomeLoadedState;

  const factory HomeState.progress() = HomeProgressState;

  const factory HomeState.success() = HomeSuccessState;

  const factory HomeState.fetched(
    List<Idiom> idioms,
    List<Proverb> proverbs,
    List<Saying> sayings,
    List<Word> words,
  ) = HomeFetchedDataState;

  const factory HomeState.filterWords(
    List<Word> words,
  ) = HomeFiteredWordsState;

  const factory HomeState.filterIdioms(
    List<Idiom> idioms,
  ) = HomeFiteredIdiomsState;

  const factory HomeState.filterSayings(
    List<Saying> sayings,
  ) = HomeFiteredSayingsState;

  const factory HomeState.filterProverbs(
    List<Proverb> proverbs,
  ) = HomeFiteredProverbsState;

  const factory HomeState.failure(String feedback) = HomeFailureState;
}
