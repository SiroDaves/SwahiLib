part of 'data_init_bloc.dart';

@freezed
class DataInitState with _$DataInitState {
  const factory DataInitState.initial() = _DataInitState;

  const factory DataInitState.loaded() = DataInitLoadedState;

  const factory DataInitState.progress() = DataInitProgressState;

  const factory DataInitState.success() = DataInitSuccessState;

  const factory DataInitState.fetched(
    List<Idiom> idioms,
    List<Proverb> proverbs,
    List<Saying> sayings,
    List<Word> words,
  ) = DataInitFetchedState;

  const factory DataInitState.saving(int progress, String feedback) =
      DataInitSavingState;

  const factory DataInitState.saved() = DataInitSavedState;

  const factory DataInitState.failure(String feedback) = DataInitFailureState;
}
