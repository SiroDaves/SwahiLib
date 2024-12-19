part of 'data_init_bloc.dart';

@freezed
sealed class DataInitEvent with _$DataInitEvent {
  const factory DataInitEvent.fetch() = FetchData;

  const factory DataInitEvent.save(
    List<Idiom> idioms,
    List<Proverb> proverbs,
    List<Saying> sayings,
    List<Word> words,
  ) = SaveData;
}
