// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sessions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(Session session) bookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(Session session)? bookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(Session session)? bookmark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchData value) fetch,
    required TResult Function(BookmarkSession value) bookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchData value)? fetch,
    TResult? Function(BookmarkSession value)? bookmark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchData value)? fetch,
    TResult Function(BookmarkSession value)? bookmark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionsEventCopyWith<$Res> {
  factory $SessionsEventCopyWith(
          SessionsEvent value, $Res Function(SessionsEvent) then) =
      _$SessionsEventCopyWithImpl<$Res, SessionsEvent>;
}

/// @nodoc
class _$SessionsEventCopyWithImpl<$Res, $Val extends SessionsEvent>
    implements $SessionsEventCopyWith<$Res> {
  _$SessionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchDataImplCopyWith<$Res> {
  factory _$$FetchDataImplCopyWith(
          _$FetchDataImpl value, $Res Function(_$FetchDataImpl) then) =
      __$$FetchDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchDataImplCopyWithImpl<$Res>
    extends _$SessionsEventCopyWithImpl<$Res, _$FetchDataImpl>
    implements _$$FetchDataImplCopyWith<$Res> {
  __$$FetchDataImplCopyWithImpl(
      _$FetchDataImpl _value, $Res Function(_$FetchDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchDataImpl implements FetchData {
  const _$FetchDataImpl();

  @override
  String toString() {
    return 'SessionsEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(Session session) bookmark,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(Session session)? bookmark,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(Session session)? bookmark,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchData value) fetch,
    required TResult Function(BookmarkSession value) bookmark,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchData value)? fetch,
    TResult? Function(BookmarkSession value)? bookmark,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchData value)? fetch,
    TResult Function(BookmarkSession value)? bookmark,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchData implements SessionsEvent {
  const factory FetchData() = _$FetchDataImpl;
}

/// @nodoc
abstract class _$$BookmarkSessionImplCopyWith<$Res> {
  factory _$$BookmarkSessionImplCopyWith(_$BookmarkSessionImpl value,
          $Res Function(_$BookmarkSessionImpl) then) =
      __$$BookmarkSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Session session});
}

/// @nodoc
class __$$BookmarkSessionImplCopyWithImpl<$Res>
    extends _$SessionsEventCopyWithImpl<$Res, _$BookmarkSessionImpl>
    implements _$$BookmarkSessionImplCopyWith<$Res> {
  __$$BookmarkSessionImplCopyWithImpl(
      _$BookmarkSessionImpl _value, $Res Function(_$BookmarkSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
  }) {
    return _then(_$BookmarkSessionImpl(
      null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
    ));
  }
}

/// @nodoc

class _$BookmarkSessionImpl implements BookmarkSession {
  const _$BookmarkSessionImpl(this.session);

  @override
  final Session session;

  @override
  String toString() {
    return 'SessionsEvent.bookmark(session: $session)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkSessionImpl &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session);

  /// Create a copy of SessionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkSessionImplCopyWith<_$BookmarkSessionImpl> get copyWith =>
      __$$BookmarkSessionImplCopyWithImpl<_$BookmarkSessionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(Session session) bookmark,
  }) {
    return bookmark(session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(Session session)? bookmark,
  }) {
    return bookmark?.call(session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(Session session)? bookmark,
    required TResult orElse(),
  }) {
    if (bookmark != null) {
      return bookmark(session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchData value) fetch,
    required TResult Function(BookmarkSession value) bookmark,
  }) {
    return bookmark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchData value)? fetch,
    TResult? Function(BookmarkSession value)? bookmark,
  }) {
    return bookmark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchData value)? fetch,
    TResult Function(BookmarkSession value)? bookmark,
    required TResult orElse(),
  }) {
    if (bookmark != null) {
      return bookmark(this);
    }
    return orElse();
  }
}

abstract class BookmarkSession implements SessionsEvent {
  const factory BookmarkSession(final Session session) = _$BookmarkSessionImpl;

  Session get session;

  /// Create a copy of SessionsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkSessionImplCopyWith<_$BookmarkSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetched,
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
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
    TResult Function(bool bookmarked)? bookmarked,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SessionsState value) initial,
    required TResult Function(SessionsLoadedState value) loaded,
    required TResult Function(SessionsProgressState value) progress,
    required TResult Function(SessionsSuccessState value) success,
    required TResult Function(SessionsFetchedState value) fetched,
    required TResult Function(SessionsBookmarkedState value) bookmarked,
    required TResult Function(SessionsFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionsState value)? initial,
    TResult? Function(SessionsLoadedState value)? loaded,
    TResult? Function(SessionsProgressState value)? progress,
    TResult? Function(SessionsSuccessState value)? success,
    TResult? Function(SessionsFetchedState value)? fetched,
    TResult? Function(SessionsBookmarkedState value)? bookmarked,
    TResult? Function(SessionsFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionsState value)? initial,
    TResult Function(SessionsLoadedState value)? loaded,
    TResult Function(SessionsProgressState value)? progress,
    TResult Function(SessionsSuccessState value)? success,
    TResult Function(SessionsFetchedState value)? fetched,
    TResult Function(SessionsBookmarkedState value)? bookmarked,
    TResult Function(SessionsFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionsStateCopyWith<$Res> {
  factory $SessionsStateCopyWith(
          SessionsState value, $Res Function(SessionsState) then) =
      _$SessionsStateCopyWithImpl<$Res, SessionsState>;
}

/// @nodoc
class _$SessionsStateCopyWithImpl<$Res, $Val extends SessionsState>
    implements $SessionsStateCopyWith<$Res> {
  _$SessionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SessionsStateImplCopyWith<$Res> {
  factory _$$SessionsStateImplCopyWith(
          _$SessionsStateImpl value, $Res Function(_$SessionsStateImpl) then) =
      __$$SessionsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionsStateImplCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsStateImpl>
    implements _$$SessionsStateImplCopyWith<$Res> {
  __$$SessionsStateImplCopyWithImpl(
      _$SessionsStateImpl _value, $Res Function(_$SessionsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionsStateImpl implements _SessionsState {
  const _$SessionsStateImpl();

  @override
  String toString() {
    return 'SessionsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionsStateImpl);
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
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetched,
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
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    required TResult Function(_SessionsState value) initial,
    required TResult Function(SessionsLoadedState value) loaded,
    required TResult Function(SessionsProgressState value) progress,
    required TResult Function(SessionsSuccessState value) success,
    required TResult Function(SessionsFetchedState value) fetched,
    required TResult Function(SessionsBookmarkedState value) bookmarked,
    required TResult Function(SessionsFailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionsState value)? initial,
    TResult? Function(SessionsLoadedState value)? loaded,
    TResult? Function(SessionsProgressState value)? progress,
    TResult? Function(SessionsSuccessState value)? success,
    TResult? Function(SessionsFetchedState value)? fetched,
    TResult? Function(SessionsBookmarkedState value)? bookmarked,
    TResult? Function(SessionsFailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionsState value)? initial,
    TResult Function(SessionsLoadedState value)? loaded,
    TResult Function(SessionsProgressState value)? progress,
    TResult Function(SessionsSuccessState value)? success,
    TResult Function(SessionsFetchedState value)? fetched,
    TResult Function(SessionsBookmarkedState value)? bookmarked,
    TResult Function(SessionsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SessionsState implements SessionsState {
  const factory _SessionsState() = _$SessionsStateImpl;
}

/// @nodoc
abstract class _$$SessionsLoadedStateImplCopyWith<$Res> {
  factory _$$SessionsLoadedStateImplCopyWith(_$SessionsLoadedStateImpl value,
          $Res Function(_$SessionsLoadedStateImpl) then) =
      __$$SessionsLoadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionsLoadedStateImplCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsLoadedStateImpl>
    implements _$$SessionsLoadedStateImplCopyWith<$Res> {
  __$$SessionsLoadedStateImplCopyWithImpl(_$SessionsLoadedStateImpl _value,
      $Res Function(_$SessionsLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionsLoadedStateImpl implements SessionsLoadedState {
  const _$SessionsLoadedStateImpl();

  @override
  String toString() {
    return 'SessionsState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionsLoadedStateImpl);
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
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetched,
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
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    required TResult Function(_SessionsState value) initial,
    required TResult Function(SessionsLoadedState value) loaded,
    required TResult Function(SessionsProgressState value) progress,
    required TResult Function(SessionsSuccessState value) success,
    required TResult Function(SessionsFetchedState value) fetched,
    required TResult Function(SessionsBookmarkedState value) bookmarked,
    required TResult Function(SessionsFailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionsState value)? initial,
    TResult? Function(SessionsLoadedState value)? loaded,
    TResult? Function(SessionsProgressState value)? progress,
    TResult? Function(SessionsSuccessState value)? success,
    TResult? Function(SessionsFetchedState value)? fetched,
    TResult? Function(SessionsBookmarkedState value)? bookmarked,
    TResult? Function(SessionsFailureState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionsState value)? initial,
    TResult Function(SessionsLoadedState value)? loaded,
    TResult Function(SessionsProgressState value)? progress,
    TResult Function(SessionsSuccessState value)? success,
    TResult Function(SessionsFetchedState value)? fetched,
    TResult Function(SessionsBookmarkedState value)? bookmarked,
    TResult Function(SessionsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SessionsLoadedState implements SessionsState {
  const factory SessionsLoadedState() = _$SessionsLoadedStateImpl;
}

/// @nodoc
abstract class _$$SessionsProgressStateImplCopyWith<$Res> {
  factory _$$SessionsProgressStateImplCopyWith(
          _$SessionsProgressStateImpl value,
          $Res Function(_$SessionsProgressStateImpl) then) =
      __$$SessionsProgressStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionsProgressStateImplCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsProgressStateImpl>
    implements _$$SessionsProgressStateImplCopyWith<$Res> {
  __$$SessionsProgressStateImplCopyWithImpl(_$SessionsProgressStateImpl _value,
      $Res Function(_$SessionsProgressStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionsProgressStateImpl implements SessionsProgressState {
  const _$SessionsProgressStateImpl();

  @override
  String toString() {
    return 'SessionsState.progress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionsProgressStateImpl);
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
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetched,
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
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    required TResult Function(_SessionsState value) initial,
    required TResult Function(SessionsLoadedState value) loaded,
    required TResult Function(SessionsProgressState value) progress,
    required TResult Function(SessionsSuccessState value) success,
    required TResult Function(SessionsFetchedState value) fetched,
    required TResult Function(SessionsBookmarkedState value) bookmarked,
    required TResult Function(SessionsFailureState value) failure,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionsState value)? initial,
    TResult? Function(SessionsLoadedState value)? loaded,
    TResult? Function(SessionsProgressState value)? progress,
    TResult? Function(SessionsSuccessState value)? success,
    TResult? Function(SessionsFetchedState value)? fetched,
    TResult? Function(SessionsBookmarkedState value)? bookmarked,
    TResult? Function(SessionsFailureState value)? failure,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionsState value)? initial,
    TResult Function(SessionsLoadedState value)? loaded,
    TResult Function(SessionsProgressState value)? progress,
    TResult Function(SessionsSuccessState value)? success,
    TResult Function(SessionsFetchedState value)? fetched,
    TResult Function(SessionsBookmarkedState value)? bookmarked,
    TResult Function(SessionsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class SessionsProgressState implements SessionsState {
  const factory SessionsProgressState() = _$SessionsProgressStateImpl;
}

/// @nodoc
abstract class _$$SessionsSuccessStateImplCopyWith<$Res> {
  factory _$$SessionsSuccessStateImplCopyWith(_$SessionsSuccessStateImpl value,
          $Res Function(_$SessionsSuccessStateImpl) then) =
      __$$SessionsSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionsSuccessStateImplCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsSuccessStateImpl>
    implements _$$SessionsSuccessStateImplCopyWith<$Res> {
  __$$SessionsSuccessStateImplCopyWithImpl(_$SessionsSuccessStateImpl _value,
      $Res Function(_$SessionsSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionsSuccessStateImpl implements SessionsSuccessState {
  const _$SessionsSuccessStateImpl();

  @override
  String toString() {
    return 'SessionsState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionsSuccessStateImpl);
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
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetched,
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
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    required TResult Function(_SessionsState value) initial,
    required TResult Function(SessionsLoadedState value) loaded,
    required TResult Function(SessionsProgressState value) progress,
    required TResult Function(SessionsSuccessState value) success,
    required TResult Function(SessionsFetchedState value) fetched,
    required TResult Function(SessionsBookmarkedState value) bookmarked,
    required TResult Function(SessionsFailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionsState value)? initial,
    TResult? Function(SessionsLoadedState value)? loaded,
    TResult? Function(SessionsProgressState value)? progress,
    TResult? Function(SessionsSuccessState value)? success,
    TResult? Function(SessionsFetchedState value)? fetched,
    TResult? Function(SessionsBookmarkedState value)? bookmarked,
    TResult? Function(SessionsFailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionsState value)? initial,
    TResult Function(SessionsLoadedState value)? loaded,
    TResult Function(SessionsProgressState value)? progress,
    TResult Function(SessionsSuccessState value)? success,
    TResult Function(SessionsFetchedState value)? fetched,
    TResult Function(SessionsBookmarkedState value)? bookmarked,
    TResult Function(SessionsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SessionsSuccessState implements SessionsState {
  const factory SessionsSuccessState() = _$SessionsSuccessStateImpl;
}

/// @nodoc
abstract class _$$SessionsFetchedStateImplCopyWith<$Res> {
  factory _$$SessionsFetchedStateImplCopyWith(_$SessionsFetchedStateImpl value,
          $Res Function(_$SessionsFetchedStateImpl) then) =
      __$$SessionsFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Bookmark> bookmarks,
      List<Room> rooms,
      List<Speaker> speakers,
      List<Session> sessions});
}

/// @nodoc
class __$$SessionsFetchedStateImplCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsFetchedStateImpl>
    implements _$$SessionsFetchedStateImplCopyWith<$Res> {
  __$$SessionsFetchedStateImplCopyWithImpl(_$SessionsFetchedStateImpl _value,
      $Res Function(_$SessionsFetchedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarks = null,
    Object? rooms = null,
    Object? speakers = null,
    Object? sessions = null,
  }) {
    return _then(_$SessionsFetchedStateImpl(
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

class _$SessionsFetchedStateImpl implements SessionsFetchedState {
  const _$SessionsFetchedStateImpl(
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
    return 'SessionsState.fetched(bookmarks: $bookmarks, rooms: $rooms, speakers: $speakers, sessions: $sessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionsFetchedStateImpl &&
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

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionsFetchedStateImplCopyWith<_$SessionsFetchedStateImpl>
      get copyWith =>
          __$$SessionsFetchedStateImplCopyWithImpl<_$SessionsFetchedStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetched,
    required TResult Function(bool bookmarked) bookmarked,
    required TResult Function(String feedback) failure,
  }) {
    return fetched(bookmarks, rooms, speakers, sessions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loaded,
    TResult? Function()? progress,
    TResult? Function()? success,
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
    TResult? Function(bool bookmarked)? bookmarked,
    TResult? Function(String feedback)? failure,
  }) {
    return fetched?.call(bookmarks, rooms, speakers, sessions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loaded,
    TResult Function()? progress,
    TResult Function()? success,
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
    TResult Function(bool bookmarked)? bookmarked,
    TResult Function(String feedback)? failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(bookmarks, rooms, speakers, sessions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SessionsState value) initial,
    required TResult Function(SessionsLoadedState value) loaded,
    required TResult Function(SessionsProgressState value) progress,
    required TResult Function(SessionsSuccessState value) success,
    required TResult Function(SessionsFetchedState value) fetched,
    required TResult Function(SessionsBookmarkedState value) bookmarked,
    required TResult Function(SessionsFailureState value) failure,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionsState value)? initial,
    TResult? Function(SessionsLoadedState value)? loaded,
    TResult? Function(SessionsProgressState value)? progress,
    TResult? Function(SessionsSuccessState value)? success,
    TResult? Function(SessionsFetchedState value)? fetched,
    TResult? Function(SessionsBookmarkedState value)? bookmarked,
    TResult? Function(SessionsFailureState value)? failure,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionsState value)? initial,
    TResult Function(SessionsLoadedState value)? loaded,
    TResult Function(SessionsProgressState value)? progress,
    TResult Function(SessionsSuccessState value)? success,
    TResult Function(SessionsFetchedState value)? fetched,
    TResult Function(SessionsBookmarkedState value)? bookmarked,
    TResult Function(SessionsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class SessionsFetchedState implements SessionsState {
  const factory SessionsFetchedState(
      final List<Bookmark> bookmarks,
      final List<Room> rooms,
      final List<Speaker> speakers,
      final List<Session> sessions) = _$SessionsFetchedStateImpl;

  List<Bookmark> get bookmarks;
  List<Room> get rooms;
  List<Speaker> get speakers;
  List<Session> get sessions;

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionsFetchedStateImplCopyWith<_$SessionsFetchedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionsBookmarkedStateImplCopyWith<$Res> {
  factory _$$SessionsBookmarkedStateImplCopyWith(
          _$SessionsBookmarkedStateImpl value,
          $Res Function(_$SessionsBookmarkedStateImpl) then) =
      __$$SessionsBookmarkedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool bookmarked});
}

/// @nodoc
class __$$SessionsBookmarkedStateImplCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsBookmarkedStateImpl>
    implements _$$SessionsBookmarkedStateImplCopyWith<$Res> {
  __$$SessionsBookmarkedStateImplCopyWithImpl(
      _$SessionsBookmarkedStateImpl _value,
      $Res Function(_$SessionsBookmarkedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarked = null,
  }) {
    return _then(_$SessionsBookmarkedStateImpl(
      null == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SessionsBookmarkedStateImpl implements SessionsBookmarkedState {
  const _$SessionsBookmarkedStateImpl(this.bookmarked);

  @override
  final bool bookmarked;

  @override
  String toString() {
    return 'SessionsState.bookmarked(bookmarked: $bookmarked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionsBookmarkedStateImpl &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookmarked);

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionsBookmarkedStateImplCopyWith<_$SessionsBookmarkedStateImpl>
      get copyWith => __$$SessionsBookmarkedStateImplCopyWithImpl<
          _$SessionsBookmarkedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetched,
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
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    required TResult Function(_SessionsState value) initial,
    required TResult Function(SessionsLoadedState value) loaded,
    required TResult Function(SessionsProgressState value) progress,
    required TResult Function(SessionsSuccessState value) success,
    required TResult Function(SessionsFetchedState value) fetched,
    required TResult Function(SessionsBookmarkedState value) bookmarked,
    required TResult Function(SessionsFailureState value) failure,
  }) {
    return bookmarked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionsState value)? initial,
    TResult? Function(SessionsLoadedState value)? loaded,
    TResult? Function(SessionsProgressState value)? progress,
    TResult? Function(SessionsSuccessState value)? success,
    TResult? Function(SessionsFetchedState value)? fetched,
    TResult? Function(SessionsBookmarkedState value)? bookmarked,
    TResult? Function(SessionsFailureState value)? failure,
  }) {
    return bookmarked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionsState value)? initial,
    TResult Function(SessionsLoadedState value)? loaded,
    TResult Function(SessionsProgressState value)? progress,
    TResult Function(SessionsSuccessState value)? success,
    TResult Function(SessionsFetchedState value)? fetched,
    TResult Function(SessionsBookmarkedState value)? bookmarked,
    TResult Function(SessionsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (bookmarked != null) {
      return bookmarked(this);
    }
    return orElse();
  }
}

abstract class SessionsBookmarkedState implements SessionsState {
  const factory SessionsBookmarkedState(final bool bookmarked) =
      _$SessionsBookmarkedStateImpl;

  bool get bookmarked;

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionsBookmarkedStateImplCopyWith<_$SessionsBookmarkedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionsFailureStateImplCopyWith<$Res> {
  factory _$$SessionsFailureStateImplCopyWith(_$SessionsFailureStateImpl value,
          $Res Function(_$SessionsFailureStateImpl) then) =
      __$$SessionsFailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedback});
}

/// @nodoc
class __$$SessionsFailureStateImplCopyWithImpl<$Res>
    extends _$SessionsStateCopyWithImpl<$Res, _$SessionsFailureStateImpl>
    implements _$$SessionsFailureStateImplCopyWith<$Res> {
  __$$SessionsFailureStateImplCopyWithImpl(_$SessionsFailureStateImpl _value,
      $Res Function(_$SessionsFailureStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
  }) {
    return _then(_$SessionsFailureStateImpl(
      null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SessionsFailureStateImpl implements SessionsFailureState {
  const _$SessionsFailureStateImpl(this.feedback);

  @override
  final String feedback;

  @override
  String toString() {
    return 'SessionsState.failure(feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionsFailureStateImpl &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback);

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionsFailureStateImplCopyWith<_$SessionsFailureStateImpl>
      get copyWith =>
          __$$SessionsFailureStateImplCopyWithImpl<_$SessionsFailureStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loaded,
    required TResult Function() progress,
    required TResult Function() success,
    required TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)
        fetched,
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
    TResult? Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    TResult Function(List<Bookmark> bookmarks, List<Room> rooms,
            List<Speaker> speakers, List<Session> sessions)?
        fetched,
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
    required TResult Function(_SessionsState value) initial,
    required TResult Function(SessionsLoadedState value) loaded,
    required TResult Function(SessionsProgressState value) progress,
    required TResult Function(SessionsSuccessState value) success,
    required TResult Function(SessionsFetchedState value) fetched,
    required TResult Function(SessionsBookmarkedState value) bookmarked,
    required TResult Function(SessionsFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionsState value)? initial,
    TResult? Function(SessionsLoadedState value)? loaded,
    TResult? Function(SessionsProgressState value)? progress,
    TResult? Function(SessionsSuccessState value)? success,
    TResult? Function(SessionsFetchedState value)? fetched,
    TResult? Function(SessionsBookmarkedState value)? bookmarked,
    TResult? Function(SessionsFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionsState value)? initial,
    TResult Function(SessionsLoadedState value)? loaded,
    TResult Function(SessionsProgressState value)? progress,
    TResult Function(SessionsSuccessState value)? success,
    TResult Function(SessionsFetchedState value)? fetched,
    TResult Function(SessionsBookmarkedState value)? bookmarked,
    TResult Function(SessionsFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class SessionsFailureState implements SessionsState {
  const factory SessionsFailureState(final String feedback) =
      _$SessionsFailureStateImpl;

  String get feedback;

  /// Create a copy of SessionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionsFailureStateImplCopyWith<_$SessionsFailureStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
