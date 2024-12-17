// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchonline,
    required TResult Function() fetchLocal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchonline,
    TResult? Function()? fetchLocal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchonline,
    TResult Function()? fetchLocal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchOnlineData value) fetchonline,
    required TResult Function(FetchLocalData value) fetchLocal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchOnlineData value)? fetchonline,
    TResult? Function(FetchLocalData value)? fetchLocal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchOnlineData value)? fetchonline,
    TResult Function(FetchLocalData value)? fetchLocal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchOnlineDataImplCopyWith<$Res> {
  factory _$$FetchOnlineDataImplCopyWith(_$FetchOnlineDataImpl value,
          $Res Function(_$FetchOnlineDataImpl) then) =
      __$$FetchOnlineDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchOnlineDataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchOnlineDataImpl>
    implements _$$FetchOnlineDataImplCopyWith<$Res> {
  __$$FetchOnlineDataImplCopyWithImpl(
      _$FetchOnlineDataImpl _value, $Res Function(_$FetchOnlineDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchOnlineDataImpl implements FetchOnlineData {
  const _$FetchOnlineDataImpl();

  @override
  String toString() {
    return 'HomeEvent.fetchonline()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchOnlineDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchonline,
    required TResult Function() fetchLocal,
  }) {
    return fetchonline();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchonline,
    TResult? Function()? fetchLocal,
  }) {
    return fetchonline?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchonline,
    TResult Function()? fetchLocal,
    required TResult orElse(),
  }) {
    if (fetchonline != null) {
      return fetchonline();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchOnlineData value) fetchonline,
    required TResult Function(FetchLocalData value) fetchLocal,
  }) {
    return fetchonline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchOnlineData value)? fetchonline,
    TResult? Function(FetchLocalData value)? fetchLocal,
  }) {
    return fetchonline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchOnlineData value)? fetchonline,
    TResult Function(FetchLocalData value)? fetchLocal,
    required TResult orElse(),
  }) {
    if (fetchonline != null) {
      return fetchonline(this);
    }
    return orElse();
  }
}

abstract class FetchOnlineData implements HomeEvent {
  const factory FetchOnlineData() = _$FetchOnlineDataImpl;
}

/// @nodoc
abstract class _$$FetchLocalDataImplCopyWith<$Res> {
  factory _$$FetchLocalDataImplCopyWith(_$FetchLocalDataImpl value,
          $Res Function(_$FetchLocalDataImpl) then) =
      __$$FetchLocalDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchLocalDataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$FetchLocalDataImpl>
    implements _$$FetchLocalDataImplCopyWith<$Res> {
  __$$FetchLocalDataImplCopyWithImpl(
      _$FetchLocalDataImpl _value, $Res Function(_$FetchLocalDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchLocalDataImpl implements FetchLocalData {
  const _$FetchLocalDataImpl();

  @override
  String toString() {
    return 'HomeEvent.fetchLocal()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchLocalDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchonline,
    required TResult Function() fetchLocal,
  }) {
    return fetchLocal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchonline,
    TResult? Function()? fetchLocal,
  }) {
    return fetchLocal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchonline,
    TResult Function()? fetchLocal,
    required TResult orElse(),
  }) {
    if (fetchLocal != null) {
      return fetchLocal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchOnlineData value) fetchonline,
    required TResult Function(FetchLocalData value) fetchLocal,
  }) {
    return fetchLocal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchOnlineData value)? fetchonline,
    TResult? Function(FetchLocalData value)? fetchLocal,
  }) {
    return fetchLocal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchOnlineData value)? fetchonline,
    TResult Function(FetchLocalData value)? fetchLocal,
    required TResult orElse(),
  }) {
    if (fetchLocal != null) {
      return fetchLocal(this);
    }
    return orElse();
  }
}

abstract class FetchLocalData implements HomeEvent {
  const factory FetchLocalData() = _$FetchLocalDataImpl;
}

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool fetched) fetchedOnline,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetchedLocal,
    required TResult Function(bool bookmarked) bookmarked,
    required TResult Function(String feedback) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool fetched)? fetchedOnline,
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult? Function(bool bookmarked)? bookmarked,
    TResult? Function(String feedback)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool fetched)? fetchedOnline,
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult Function(bool bookmarked)? bookmarked,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeProgressState value) progress,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedOnlineState value) fetchedOnline,
    required TResult Function(HomeFetchedLocalState value) fetchedLocal,
    required TResult Function(HomeBookmarkedState value) bookmarked,
    required TResult Function(HomeFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeProgressState value)? progress,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult? Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult? Function(HomeBookmarkedState value)? bookmarked,
    TResult? Function(HomeFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeProgressState value)? progress,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult Function(HomeBookmarkedState value)? bookmarked,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool fetched) fetchedOnline,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetchedLocal,
    required TResult Function(bool bookmarked) bookmarked,
    required TResult Function(String feedback) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool fetched)? fetchedOnline,
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult? Function(bool bookmarked)? bookmarked,
    TResult? Function(String feedback)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool fetched)? fetchedOnline,
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult Function(bool bookmarked)? bookmarked,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeProgressState value) progress,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedOnlineState value) fetchedOnline,
    required TResult Function(HomeFetchedLocalState value) fetchedLocal,
    required TResult Function(HomeBookmarkedState value) bookmarked,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeProgressState value)? progress,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult? Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult? Function(HomeBookmarkedState value)? bookmarked,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeProgressState value)? progress,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult Function(HomeBookmarkedState value)? bookmarked,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _HomeState implements HomeState {
  const factory _HomeState() = _$HomeStateImpl;
}

/// @nodoc
abstract class _$$HomeLoadedStateImplCopyWith<$Res> {
  factory _$$HomeLoadedStateImplCopyWith(_$HomeLoadedStateImpl value,
          $Res Function(_$HomeLoadedStateImpl) then) =
      __$$HomeLoadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeLoadedStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeLoadedStateImpl>
    implements _$$HomeLoadedStateImplCopyWith<$Res> {
  __$$HomeLoadedStateImplCopyWithImpl(
      _$HomeLoadedStateImpl _value, $Res Function(_$HomeLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeLoadedStateImpl implements HomeLoadedState {
  const _$HomeLoadedStateImpl();

  @override
  String toString() {
    return 'HomeState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeLoadedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool fetched) fetchedOnline,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetchedLocal,
    required TResult Function(bool bookmarked) bookmarked,
    required TResult Function(String feedback) failure,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool fetched)? fetchedOnline,
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult? Function(bool bookmarked)? bookmarked,
    TResult? Function(String feedback)? failure,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool fetched)? fetchedOnline,
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult Function(bool bookmarked)? bookmarked,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeProgressState value) progress,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedOnlineState value) fetchedOnline,
    required TResult Function(HomeFetchedLocalState value) fetchedLocal,
    required TResult Function(HomeBookmarkedState value) bookmarked,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeProgressState value)? progress,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult? Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult? Function(HomeBookmarkedState value)? bookmarked,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeProgressState value)? progress,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult Function(HomeBookmarkedState value)? bookmarked,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeLoadedState implements HomeState {
  const factory HomeLoadedState() = _$HomeLoadedStateImpl;
}

/// @nodoc
abstract class _$$HomeProgressStateImplCopyWith<$Res> {
  factory _$$HomeProgressStateImplCopyWith(_$HomeProgressStateImpl value,
          $Res Function(_$HomeProgressStateImpl) then) =
      __$$HomeProgressStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeProgressStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeProgressStateImpl>
    implements _$$HomeProgressStateImplCopyWith<$Res> {
  __$$HomeProgressStateImplCopyWithImpl(_$HomeProgressStateImpl _value,
      $Res Function(_$HomeProgressStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeProgressStateImpl implements HomeProgressState {
  const _$HomeProgressStateImpl();

  @override
  String toString() {
    return 'HomeState.progress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeProgressStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool fetched) fetchedOnline,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetchedLocal,
    required TResult Function(bool bookmarked) bookmarked,
    required TResult Function(String feedback) failure,
  }) {
    return progress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool fetched)? fetchedOnline,
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult? Function(bool bookmarked)? bookmarked,
    TResult? Function(String feedback)? failure,
  }) {
    return progress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool fetched)? fetchedOnline,
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult Function(bool bookmarked)? bookmarked,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeProgressState value) progress,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedOnlineState value) fetchedOnline,
    required TResult Function(HomeFetchedLocalState value) fetchedLocal,
    required TResult Function(HomeBookmarkedState value) bookmarked,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeProgressState value)? progress,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult? Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult? Function(HomeBookmarkedState value)? bookmarked,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeProgressState value)? progress,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult Function(HomeBookmarkedState value)? bookmarked,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class HomeProgressState implements HomeState {
  const factory HomeProgressState() = _$HomeProgressStateImpl;
}

/// @nodoc
abstract class _$$HomeSuccessStateImplCopyWith<$Res> {
  factory _$$HomeSuccessStateImplCopyWith(_$HomeSuccessStateImpl value,
          $Res Function(_$HomeSuccessStateImpl) then) =
      __$$HomeSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeSuccessStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeSuccessStateImpl>
    implements _$$HomeSuccessStateImplCopyWith<$Res> {
  __$$HomeSuccessStateImplCopyWithImpl(_$HomeSuccessStateImpl _value,
      $Res Function(_$HomeSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeSuccessStateImpl implements HomeSuccessState {
  const _$HomeSuccessStateImpl();

  @override
  String toString() {
    return 'HomeState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool fetched) fetchedOnline,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetchedLocal,
    required TResult Function(bool bookmarked) bookmarked,
    required TResult Function(String feedback) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool fetched)? fetchedOnline,
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult? Function(bool bookmarked)? bookmarked,
    TResult? Function(String feedback)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool fetched)? fetchedOnline,
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult Function(bool bookmarked)? bookmarked,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeProgressState value) progress,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedOnlineState value) fetchedOnline,
    required TResult Function(HomeFetchedLocalState value) fetchedLocal,
    required TResult Function(HomeBookmarkedState value) bookmarked,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeProgressState value)? progress,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult? Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult? Function(HomeBookmarkedState value)? bookmarked,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeProgressState value)? progress,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult Function(HomeBookmarkedState value)? bookmarked,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class HomeSuccessState implements HomeState {
  const factory HomeSuccessState() = _$HomeSuccessStateImpl;
}

/// @nodoc
abstract class _$$HomeFetchedOnlineStateImplCopyWith<$Res> {
  factory _$$HomeFetchedOnlineStateImplCopyWith(
          _$HomeFetchedOnlineStateImpl value,
          $Res Function(_$HomeFetchedOnlineStateImpl) then) =
      __$$HomeFetchedOnlineStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool fetched});
}

/// @nodoc
class __$$HomeFetchedOnlineStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeFetchedOnlineStateImpl>
    implements _$$HomeFetchedOnlineStateImplCopyWith<$Res> {
  __$$HomeFetchedOnlineStateImplCopyWithImpl(
      _$HomeFetchedOnlineStateImpl _value,
      $Res Function(_$HomeFetchedOnlineStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetched = null,
  }) {
    return _then(_$HomeFetchedOnlineStateImpl(
      null == fetched
          ? _value.fetched
          : fetched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeFetchedOnlineStateImpl implements HomeFetchedOnlineState {
  const _$HomeFetchedOnlineStateImpl(this.fetched);

  @override
  final bool fetched;

  @override
  String toString() {
    return 'HomeState.fetchedOnline(fetched: $fetched)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFetchedOnlineStateImpl &&
            (identical(other.fetched, fetched) || other.fetched == fetched));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetched);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeFetchedOnlineStateImplCopyWith<_$HomeFetchedOnlineStateImpl>
      get copyWith => __$$HomeFetchedOnlineStateImplCopyWithImpl<
          _$HomeFetchedOnlineStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool fetched) fetchedOnline,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetchedLocal,
    required TResult Function(bool bookmarked) bookmarked,
    required TResult Function(String feedback) failure,
  }) {
    return fetchedOnline(fetched);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool fetched)? fetchedOnline,
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult? Function(bool bookmarked)? bookmarked,
    TResult? Function(String feedback)? failure,
  }) {
    return fetchedOnline?.call(fetched);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool fetched)? fetchedOnline,
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult Function(bool bookmarked)? bookmarked,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (fetchedOnline != null) {
      return fetchedOnline(fetched);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeProgressState value) progress,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedOnlineState value) fetchedOnline,
    required TResult Function(HomeFetchedLocalState value) fetchedLocal,
    required TResult Function(HomeBookmarkedState value) bookmarked,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return fetchedOnline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeProgressState value)? progress,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult? Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult? Function(HomeBookmarkedState value)? bookmarked,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return fetchedOnline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeProgressState value)? progress,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult Function(HomeBookmarkedState value)? bookmarked,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (fetchedOnline != null) {
      return fetchedOnline(this);
    }
    return orElse();
  }
}

abstract class HomeFetchedOnlineState implements HomeState {
  const factory HomeFetchedOnlineState(final bool fetched) =
      _$HomeFetchedOnlineStateImpl;

  bool get fetched;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeFetchedOnlineStateImplCopyWith<_$HomeFetchedOnlineStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeFetchedLocalStateImplCopyWith<$Res> {
  factory _$$HomeFetchedLocalStateImplCopyWith(
          _$HomeFetchedLocalStateImpl value,
          $Res Function(_$HomeFetchedLocalStateImpl) then) =
      __$$HomeFetchedLocalStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Bookmark> bookmarks,
      List<Room> rooms,
      List<Speaker> speakers,
      List<Session> sessions});
}

/// @nodoc
class __$$HomeFetchedLocalStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeFetchedLocalStateImpl>
    implements _$$HomeFetchedLocalStateImplCopyWith<$Res> {
  __$$HomeFetchedLocalStateImplCopyWithImpl(_$HomeFetchedLocalStateImpl _value,
      $Res Function(_$HomeFetchedLocalStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarks = null,
    Object? rooms = null,
    Object? speakers = null,
    Object? sessions = null,
  }) {
    return _then(_$HomeFetchedLocalStateImpl(
      null == bookmarks
          ? _value._bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<Bookmark>,
      null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
      null == speakers
          ? _value._speakers
          : speakers // ignore: cast_nullable_to_non_nullable
              as List<Speaker>,
      null == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

/// @nodoc

class _$HomeFetchedLocalStateImpl implements HomeFetchedLocalState {
  const _$HomeFetchedLocalStateImpl(
      final List<Bookmark> bookmarks,
      final List<Room> rooms,
      final List<Speaker> speakers,
      final List<Session> sessions)
      : _bookmarks = bookmarks,
        _rooms = rooms,
        _speakers = speakers,
        _sessions = sessions;

  final List<Bookmark> _bookmarks;
  @override
  List<Bookmark> get bookmarks {
    if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarks);
  }

  final List<Room> _rooms;
  @override
  List<Room> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  final List<Speaker> _speakers;
  @override
  List<Speaker> get speakers {
    if (_speakers is EqualUnmodifiableListView) return _speakers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_speakers);
  }

  final List<Session> _sessions;
  @override
  List<Session> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  String toString() {
    return 'HomeState.fetchedLocal(bookmarks: $bookmarks, rooms: $rooms, speakers: $speakers, sessions: $sessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFetchedLocalStateImpl &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms) &&
            const DeepCollectionEquality().equals(other._speakers, _speakers) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bookmarks),
      const DeepCollectionEquality().hash(_rooms),
      const DeepCollectionEquality().hash(_speakers),
      const DeepCollectionEquality().hash(_sessions));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeFetchedLocalStateImplCopyWith<_$HomeFetchedLocalStateImpl>
      get copyWith => __$$HomeFetchedLocalStateImplCopyWithImpl<
          _$HomeFetchedLocalStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool fetched) fetchedOnline,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetchedLocal,
    required TResult Function(bool bookmarked) bookmarked,
    required TResult Function(String feedback) failure,
  }) {
    return fetchedLocal(bookmarks, rooms, speakers, sessions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool fetched)? fetchedOnline,
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult? Function(bool bookmarked)? bookmarked,
    TResult? Function(String feedback)? failure,
  }) {
    return fetchedLocal?.call(bookmarks, rooms, speakers, sessions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool fetched)? fetchedOnline,
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult Function(bool bookmarked)? bookmarked,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (fetchedLocal != null) {
      return fetchedLocal(bookmarks, rooms, speakers, sessions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeProgressState value) progress,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedOnlineState value) fetchedOnline,
    required TResult Function(HomeFetchedLocalState value) fetchedLocal,
    required TResult Function(HomeBookmarkedState value) bookmarked,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return fetchedLocal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeProgressState value)? progress,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult? Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult? Function(HomeBookmarkedState value)? bookmarked,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return fetchedLocal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeProgressState value)? progress,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult Function(HomeBookmarkedState value)? bookmarked,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (fetchedLocal != null) {
      return fetchedLocal(this);
    }
    return orElse();
  }
}

abstract class HomeFetchedLocalState implements HomeState {
  const factory HomeFetchedLocalState(
      final List<Bookmark> bookmarks,
      final List<Room> rooms,
      final List<Speaker> speakers,
      final List<Session> sessions) = _$HomeFetchedLocalStateImpl;

  List<Bookmark> get bookmarks;
  List<Room> get rooms;
  List<Speaker> get speakers;
  List<Session> get sessions;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeFetchedLocalStateImplCopyWith<_$HomeFetchedLocalStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeBookmarkedStateImplCopyWith<$Res> {
  factory _$$HomeBookmarkedStateImplCopyWith(_$HomeBookmarkedStateImpl value,
          $Res Function(_$HomeBookmarkedStateImpl) then) =
      __$$HomeBookmarkedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool bookmarked});
}

/// @nodoc
class __$$HomeBookmarkedStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeBookmarkedStateImpl>
    implements _$$HomeBookmarkedStateImplCopyWith<$Res> {
  __$$HomeBookmarkedStateImplCopyWithImpl(_$HomeBookmarkedStateImpl _value,
      $Res Function(_$HomeBookmarkedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarked = null,
  }) {
    return _then(_$HomeBookmarkedStateImpl(
      null == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeBookmarkedStateImpl implements HomeBookmarkedState {
  const _$HomeBookmarkedStateImpl(this.bookmarked);

  @override
  final bool bookmarked;

  @override
  String toString() {
    return 'HomeState.bookmarked(bookmarked: $bookmarked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeBookmarkedStateImpl &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookmarked);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeBookmarkedStateImplCopyWith<_$HomeBookmarkedStateImpl> get copyWith =>
      __$$HomeBookmarkedStateImplCopyWithImpl<_$HomeBookmarkedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool fetched) fetchedOnline,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetchedLocal,
    required TResult Function(bool bookmarked) bookmarked,
    required TResult Function(String feedback) failure,
  }) {
    return bookmarked(this.bookmarked);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool fetched)? fetchedOnline,
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult? Function(bool bookmarked)? bookmarked,
    TResult? Function(String feedback)? failure,
  }) {
    return bookmarked?.call(this.bookmarked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool fetched)? fetchedOnline,
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult Function(bool bookmarked)? bookmarked,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (bookmarked != null) {
      return bookmarked(this.bookmarked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeProgressState value) progress,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedOnlineState value) fetchedOnline,
    required TResult Function(HomeFetchedLocalState value) fetchedLocal,
    required TResult Function(HomeBookmarkedState value) bookmarked,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return bookmarked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeProgressState value)? progress,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult? Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult? Function(HomeBookmarkedState value)? bookmarked,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return bookmarked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeProgressState value)? progress,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult Function(HomeBookmarkedState value)? bookmarked,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (bookmarked != null) {
      return bookmarked(this);
    }
    return orElse();
  }
}

abstract class HomeBookmarkedState implements HomeState {
  const factory HomeBookmarkedState(final bool bookmarked) =
      _$HomeBookmarkedStateImpl;

  bool get bookmarked;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeBookmarkedStateImplCopyWith<_$HomeBookmarkedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeFailureStateImplCopyWith<$Res> {
  factory _$$HomeFailureStateImplCopyWith(_$HomeFailureStateImpl value,
          $Res Function(_$HomeFailureStateImpl) then) =
      __$$HomeFailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedback});
}

/// @nodoc
class __$$HomeFailureStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeFailureStateImpl>
    implements _$$HomeFailureStateImplCopyWith<$Res> {
  __$$HomeFailureStateImplCopyWithImpl(_$HomeFailureStateImpl _value,
      $Res Function(_$HomeFailureStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
  }) {
    return _then(_$HomeFailureStateImpl(
      null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeFailureStateImpl implements HomeFailureState {
  const _$HomeFailureStateImpl(this.feedback);

  @override
  final String feedback;

  @override
  String toString() {
    return 'HomeState.failure(feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFailureStateImpl &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeFailureStateImplCopyWith<_$HomeFailureStateImpl> get copyWith =>
      __$$HomeFailureStateImplCopyWithImpl<_$HomeFailureStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(bool fetched) fetchedOnline,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetchedLocal,
    required TResult Function(bool bookmarked) bookmarked,
    required TResult Function(String feedback) failure,
  }) {
    return failure(feedback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(bool fetched)? fetchedOnline,
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult? Function(bool bookmarked)? bookmarked,
    TResult? Function(String feedback)? failure,
  }) {
    return failure?.call(feedback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(bool fetched)? fetchedOnline,
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetchedLocal,
    TResult Function(bool bookmarked)? bookmarked,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(feedback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HomeState value) initial,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeProgressState value) progress,
    required TResult Function(HomeSuccessState value) success,
    required TResult Function(HomeFetchedOnlineState value) fetchedOnline,
    required TResult Function(HomeFetchedLocalState value) fetchedLocal,
    required TResult Function(HomeBookmarkedState value) bookmarked,
    required TResult Function(HomeFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HomeState value)? initial,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeProgressState value)? progress,
    TResult? Function(HomeSuccessState value)? success,
    TResult? Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult? Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult? Function(HomeBookmarkedState value)? bookmarked,
    TResult? Function(HomeFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HomeState value)? initial,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeProgressState value)? progress,
    TResult Function(HomeSuccessState value)? success,
    TResult Function(HomeFetchedOnlineState value)? fetchedOnline,
    TResult Function(HomeFetchedLocalState value)? fetchedLocal,
    TResult Function(HomeBookmarkedState value)? bookmarked,
    TResult Function(HomeFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class HomeFailureState implements HomeState {
  const factory HomeFailureState(final String feedback) =
      _$HomeFailureStateImpl;

  String get feedback;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeFailureStateImplCopyWith<_$HomeFailureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
