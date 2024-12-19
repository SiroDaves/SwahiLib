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

  const factory HomeState.failure(String feedback) = HomeFailureState;
}
