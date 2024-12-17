// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speakers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpeakersEvent {
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
abstract class $SpeakersEventCopyWith<$Res> {
  factory $SpeakersEventCopyWith(
          SpeakersEvent value, $Res Function(SpeakersEvent) then) =
      _$SpeakersEventCopyWithImpl<$Res, SpeakersEvent>;
}

/// @nodoc
class _$SpeakersEventCopyWithImpl<$Res, $Val extends SpeakersEvent>
    implements $SpeakersEventCopyWith<$Res> {
  _$SpeakersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeakersEvent
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
    extends _$SpeakersEventCopyWithImpl<$Res, _$FetchDataImpl>
    implements _$$FetchDataImplCopyWith<$Res> {
  __$$FetchDataImplCopyWithImpl(
      _$FetchDataImpl _value, $Res Function(_$FetchDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeakersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchDataImpl implements FetchData {
  const _$FetchDataImpl();

  @override
  String toString() {
    return 'SpeakersEvent.fetch()';
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

abstract class FetchData implements SpeakersEvent {
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
    extends _$SpeakersEventCopyWithImpl<$Res, _$BookmarkSessionImpl>
    implements _$$BookmarkSessionImplCopyWith<$Res> {
  __$$BookmarkSessionImplCopyWithImpl(
      _$BookmarkSessionImpl _value, $Res Function(_$BookmarkSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeakersEvent
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
    return 'SpeakersEvent.bookmark(session: $session)';
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

  /// Create a copy of SpeakersEvent
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

abstract class BookmarkSession implements SpeakersEvent {
  const factory BookmarkSession(final Session session) = _$BookmarkSessionImpl;

  Session get session;

  /// Create a copy of SpeakersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkSessionImplCopyWith<_$BookmarkSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SpeakersState {
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
    required TResult Function(_SpeakersState value) initial,
    required TResult Function(SpeakersLoadedState value) loaded,
    required TResult Function(SpeakersProgressState value) progress,
    required TResult Function(SpeakersSuccessState value) success,
    required TResult Function(SpeakersFetchedState value) fetched,
    required TResult Function(SpeakersBookmarkedState value) bookmarked,
    required TResult Function(SpeakersFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SpeakersState value)? initial,
    TResult? Function(SpeakersLoadedState value)? loaded,
    TResult? Function(SpeakersProgressState value)? progress,
    TResult? Function(SpeakersSuccessState value)? success,
    TResult? Function(SpeakersFetchedState value)? fetched,
    TResult? Function(SpeakersBookmarkedState value)? bookmarked,
    TResult? Function(SpeakersFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SpeakersState value)? initial,
    TResult Function(SpeakersLoadedState value)? loaded,
    TResult Function(SpeakersProgressState value)? progress,
    TResult Function(SpeakersSuccessState value)? success,
    TResult Function(SpeakersFetchedState value)? fetched,
    TResult Function(SpeakersBookmarkedState value)? bookmarked,
    TResult Function(SpeakersFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeakersStateCopyWith<$Res> {
  factory $SpeakersStateCopyWith(
          SpeakersState value, $Res Function(SpeakersState) then) =
      _$SpeakersStateCopyWithImpl<$Res, SpeakersState>;
}

/// @nodoc
class _$SpeakersStateCopyWithImpl<$Res, $Val extends SpeakersState>
    implements $SpeakersStateCopyWith<$Res> {
  _$SpeakersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SpeakersStateImplCopyWith<$Res> {
  factory _$$SpeakersStateImplCopyWith(
          _$SpeakersStateImpl value, $Res Function(_$SpeakersStateImpl) then) =
      __$$SpeakersStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SpeakersStateImplCopyWithImpl<$Res>
    extends _$SpeakersStateCopyWithImpl<$Res, _$SpeakersStateImpl>
    implements _$$SpeakersStateImplCopyWith<$Res> {
  __$$SpeakersStateImplCopyWithImpl(
      _$SpeakersStateImpl _value, $Res Function(_$SpeakersStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SpeakersStateImpl implements _SpeakersState {
  const _$SpeakersStateImpl();

  @override
  String toString() {
    return 'SpeakersState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SpeakersStateImpl);
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
    required TResult Function(_SpeakersState value) initial,
    required TResult Function(SpeakersLoadedState value) loaded,
    required TResult Function(SpeakersProgressState value) progress,
    required TResult Function(SpeakersSuccessState value) success,
    required TResult Function(SpeakersFetchedState value) fetched,
    required TResult Function(SpeakersBookmarkedState value) bookmarked,
    required TResult Function(SpeakersFailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SpeakersState value)? initial,
    TResult? Function(SpeakersLoadedState value)? loaded,
    TResult? Function(SpeakersProgressState value)? progress,
    TResult? Function(SpeakersSuccessState value)? success,
    TResult? Function(SpeakersFetchedState value)? fetched,
    TResult? Function(SpeakersBookmarkedState value)? bookmarked,
    TResult? Function(SpeakersFailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SpeakersState value)? initial,
    TResult Function(SpeakersLoadedState value)? loaded,
    TResult Function(SpeakersProgressState value)? progress,
    TResult Function(SpeakersSuccessState value)? success,
    TResult Function(SpeakersFetchedState value)? fetched,
    TResult Function(SpeakersBookmarkedState value)? bookmarked,
    TResult Function(SpeakersFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SpeakersState implements SpeakersState {
  const factory _SpeakersState() = _$SpeakersStateImpl;
}

/// @nodoc
abstract class _$$SpeakersLoadedStateImplCopyWith<$Res> {
  factory _$$SpeakersLoadedStateImplCopyWith(_$SpeakersLoadedStateImpl value,
          $Res Function(_$SpeakersLoadedStateImpl) then) =
      __$$SpeakersLoadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SpeakersLoadedStateImplCopyWithImpl<$Res>
    extends _$SpeakersStateCopyWithImpl<$Res, _$SpeakersLoadedStateImpl>
    implements _$$SpeakersLoadedStateImplCopyWith<$Res> {
  __$$SpeakersLoadedStateImplCopyWithImpl(_$SpeakersLoadedStateImpl _value,
      $Res Function(_$SpeakersLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SpeakersLoadedStateImpl implements SpeakersLoadedState {
  const _$SpeakersLoadedStateImpl();

  @override
  String toString() {
    return 'SpeakersState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeakersLoadedStateImpl);
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
    required TResult Function(_SpeakersState value) initial,
    required TResult Function(SpeakersLoadedState value) loaded,
    required TResult Function(SpeakersProgressState value) progress,
    required TResult Function(SpeakersSuccessState value) success,
    required TResult Function(SpeakersFetchedState value) fetched,
    required TResult Function(SpeakersBookmarkedState value) bookmarked,
    required TResult Function(SpeakersFailureState value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SpeakersState value)? initial,
    TResult? Function(SpeakersLoadedState value)? loaded,
    TResult? Function(SpeakersProgressState value)? progress,
    TResult? Function(SpeakersSuccessState value)? success,
    TResult? Function(SpeakersFetchedState value)? fetched,
    TResult? Function(SpeakersBookmarkedState value)? bookmarked,
    TResult? Function(SpeakersFailureState value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SpeakersState value)? initial,
    TResult Function(SpeakersLoadedState value)? loaded,
    TResult Function(SpeakersProgressState value)? progress,
    TResult Function(SpeakersSuccessState value)? success,
    TResult Function(SpeakersFetchedState value)? fetched,
    TResult Function(SpeakersBookmarkedState value)? bookmarked,
    TResult Function(SpeakersFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SpeakersLoadedState implements SpeakersState {
  const factory SpeakersLoadedState() = _$SpeakersLoadedStateImpl;
}

/// @nodoc
abstract class _$$SpeakersProgressStateImplCopyWith<$Res> {
  factory _$$SpeakersProgressStateImplCopyWith(
          _$SpeakersProgressStateImpl value,
          $Res Function(_$SpeakersProgressStateImpl) then) =
      __$$SpeakersProgressStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SpeakersProgressStateImplCopyWithImpl<$Res>
    extends _$SpeakersStateCopyWithImpl<$Res, _$SpeakersProgressStateImpl>
    implements _$$SpeakersProgressStateImplCopyWith<$Res> {
  __$$SpeakersProgressStateImplCopyWithImpl(_$SpeakersProgressStateImpl _value,
      $Res Function(_$SpeakersProgressStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SpeakersProgressStateImpl implements SpeakersProgressState {
  const _$SpeakersProgressStateImpl();

  @override
  String toString() {
    return 'SpeakersState.progress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeakersProgressStateImpl);
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
    required TResult Function(_SpeakersState value) initial,
    required TResult Function(SpeakersLoadedState value) loaded,
    required TResult Function(SpeakersProgressState value) progress,
    required TResult Function(SpeakersSuccessState value) success,
    required TResult Function(SpeakersFetchedState value) fetched,
    required TResult Function(SpeakersBookmarkedState value) bookmarked,
    required TResult Function(SpeakersFailureState value) failure,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SpeakersState value)? initial,
    TResult? Function(SpeakersLoadedState value)? loaded,
    TResult? Function(SpeakersProgressState value)? progress,
    TResult? Function(SpeakersSuccessState value)? success,
    TResult? Function(SpeakersFetchedState value)? fetched,
    TResult? Function(SpeakersBookmarkedState value)? bookmarked,
    TResult? Function(SpeakersFailureState value)? failure,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SpeakersState value)? initial,
    TResult Function(SpeakersLoadedState value)? loaded,
    TResult Function(SpeakersProgressState value)? progress,
    TResult Function(SpeakersSuccessState value)? success,
    TResult Function(SpeakersFetchedState value)? fetched,
    TResult Function(SpeakersBookmarkedState value)? bookmarked,
    TResult Function(SpeakersFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class SpeakersProgressState implements SpeakersState {
  const factory SpeakersProgressState() = _$SpeakersProgressStateImpl;
}

/// @nodoc
abstract class _$$SpeakersSuccessStateImplCopyWith<$Res> {
  factory _$$SpeakersSuccessStateImplCopyWith(_$SpeakersSuccessStateImpl value,
          $Res Function(_$SpeakersSuccessStateImpl) then) =
      __$$SpeakersSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SpeakersSuccessStateImplCopyWithImpl<$Res>
    extends _$SpeakersStateCopyWithImpl<$Res, _$SpeakersSuccessStateImpl>
    implements _$$SpeakersSuccessStateImplCopyWith<$Res> {
  __$$SpeakersSuccessStateImplCopyWithImpl(_$SpeakersSuccessStateImpl _value,
      $Res Function(_$SpeakersSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SpeakersSuccessStateImpl implements SpeakersSuccessState {
  const _$SpeakersSuccessStateImpl();

  @override
  String toString() {
    return 'SpeakersState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeakersSuccessStateImpl);
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
    required TResult Function(_SpeakersState value) initial,
    required TResult Function(SpeakersLoadedState value) loaded,
    required TResult Function(SpeakersProgressState value) progress,
    required TResult Function(SpeakersSuccessState value) success,
    required TResult Function(SpeakersFetchedState value) fetched,
    required TResult Function(SpeakersBookmarkedState value) bookmarked,
    required TResult Function(SpeakersFailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SpeakersState value)? initial,
    TResult? Function(SpeakersLoadedState value)? loaded,
    TResult? Function(SpeakersProgressState value)? progress,
    TResult? Function(SpeakersSuccessState value)? success,
    TResult? Function(SpeakersFetchedState value)? fetched,
    TResult? Function(SpeakersBookmarkedState value)? bookmarked,
    TResult? Function(SpeakersFailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SpeakersState value)? initial,
    TResult Function(SpeakersLoadedState value)? loaded,
    TResult Function(SpeakersProgressState value)? progress,
    TResult Function(SpeakersSuccessState value)? success,
    TResult Function(SpeakersFetchedState value)? fetched,
    TResult Function(SpeakersBookmarkedState value)? bookmarked,
    TResult Function(SpeakersFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SpeakersSuccessState implements SpeakersState {
  const factory SpeakersSuccessState() = _$SpeakersSuccessStateImpl;
}

/// @nodoc
abstract class _$$SpeakersFetchedStateImplCopyWith<$Res> {
  factory _$$SpeakersFetchedStateImplCopyWith(_$SpeakersFetchedStateImpl value,
          $Res Function(_$SpeakersFetchedStateImpl) then) =
      __$$SpeakersFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Bookmark> bookmarks,
      List<Room> rooms,
      List<Speaker> speakers,
      List<Session> sessions});
}

/// @nodoc
class __$$SpeakersFetchedStateImplCopyWithImpl<$Res>
    extends _$SpeakersStateCopyWithImpl<$Res, _$SpeakersFetchedStateImpl>
    implements _$$SpeakersFetchedStateImplCopyWith<$Res> {
  __$$SpeakersFetchedStateImplCopyWithImpl(_$SpeakersFetchedStateImpl _value,
      $Res Function(_$SpeakersFetchedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarks = null,
    Object? rooms = null,
    Object? speakers = null,
    Object? sessions = null,
  }) {
    return _then(_$SpeakersFetchedStateImpl(
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

class _$SpeakersFetchedStateImpl implements SpeakersFetchedState {
  const _$SpeakersFetchedStateImpl(
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
    return 'SpeakersState.fetched(bookmarks: $bookmarks, rooms: $rooms, speakers: $speakers, sessions: $sessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeakersFetchedStateImpl &&
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

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeakersFetchedStateImplCopyWith<_$SpeakersFetchedStateImpl>
      get copyWith =>
          __$$SpeakersFetchedStateImplCopyWithImpl<_$SpeakersFetchedStateImpl>(
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
    required TResult Function(_SpeakersState value) initial,
    required TResult Function(SpeakersLoadedState value) loaded,
    required TResult Function(SpeakersProgressState value) progress,
    required TResult Function(SpeakersSuccessState value) success,
    required TResult Function(SpeakersFetchedState value) fetched,
    required TResult Function(SpeakersBookmarkedState value) bookmarked,
    required TResult Function(SpeakersFailureState value) failure,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SpeakersState value)? initial,
    TResult? Function(SpeakersLoadedState value)? loaded,
    TResult? Function(SpeakersProgressState value)? progress,
    TResult? Function(SpeakersSuccessState value)? success,
    TResult? Function(SpeakersFetchedState value)? fetched,
    TResult? Function(SpeakersBookmarkedState value)? bookmarked,
    TResult? Function(SpeakersFailureState value)? failure,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SpeakersState value)? initial,
    TResult Function(SpeakersLoadedState value)? loaded,
    TResult Function(SpeakersProgressState value)? progress,
    TResult Function(SpeakersSuccessState value)? success,
    TResult Function(SpeakersFetchedState value)? fetched,
    TResult Function(SpeakersBookmarkedState value)? bookmarked,
    TResult Function(SpeakersFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class SpeakersFetchedState implements SpeakersState {
  const factory SpeakersFetchedState(
      final List<Bookmark> bookmarks,
      final List<Room> rooms,
      final List<Speaker> speakers,
      final List<Session> sessions) = _$SpeakersFetchedStateImpl;

  List<Bookmark> get bookmarks;
  List<Room> get rooms;
  List<Speaker> get speakers;
  List<Session> get sessions;

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeakersFetchedStateImplCopyWith<_$SpeakersFetchedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpeakersBookmarkedStateImplCopyWith<$Res> {
  factory _$$SpeakersBookmarkedStateImplCopyWith(
          _$SpeakersBookmarkedStateImpl value,
          $Res Function(_$SpeakersBookmarkedStateImpl) then) =
      __$$SpeakersBookmarkedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool bookmarked});
}

/// @nodoc
class __$$SpeakersBookmarkedStateImplCopyWithImpl<$Res>
    extends _$SpeakersStateCopyWithImpl<$Res, _$SpeakersBookmarkedStateImpl>
    implements _$$SpeakersBookmarkedStateImplCopyWith<$Res> {
  __$$SpeakersBookmarkedStateImplCopyWithImpl(
      _$SpeakersBookmarkedStateImpl _value,
      $Res Function(_$SpeakersBookmarkedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarked = null,
  }) {
    return _then(_$SpeakersBookmarkedStateImpl(
      null == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SpeakersBookmarkedStateImpl implements SpeakersBookmarkedState {
  const _$SpeakersBookmarkedStateImpl(this.bookmarked);

  @override
  final bool bookmarked;

  @override
  String toString() {
    return 'SpeakersState.bookmarked(bookmarked: $bookmarked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeakersBookmarkedStateImpl &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookmarked);

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeakersBookmarkedStateImplCopyWith<_$SpeakersBookmarkedStateImpl>
      get copyWith => __$$SpeakersBookmarkedStateImplCopyWithImpl<
          _$SpeakersBookmarkedStateImpl>(this, _$identity);

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
    required TResult Function(_SpeakersState value) initial,
    required TResult Function(SpeakersLoadedState value) loaded,
    required TResult Function(SpeakersProgressState value) progress,
    required TResult Function(SpeakersSuccessState value) success,
    required TResult Function(SpeakersFetchedState value) fetched,
    required TResult Function(SpeakersBookmarkedState value) bookmarked,
    required TResult Function(SpeakersFailureState value) failure,
  }) {
    return bookmarked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SpeakersState value)? initial,
    TResult? Function(SpeakersLoadedState value)? loaded,
    TResult? Function(SpeakersProgressState value)? progress,
    TResult? Function(SpeakersSuccessState value)? success,
    TResult? Function(SpeakersFetchedState value)? fetched,
    TResult? Function(SpeakersBookmarkedState value)? bookmarked,
    TResult? Function(SpeakersFailureState value)? failure,
  }) {
    return bookmarked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SpeakersState value)? initial,
    TResult Function(SpeakersLoadedState value)? loaded,
    TResult Function(SpeakersProgressState value)? progress,
    TResult Function(SpeakersSuccessState value)? success,
    TResult Function(SpeakersFetchedState value)? fetched,
    TResult Function(SpeakersBookmarkedState value)? bookmarked,
    TResult Function(SpeakersFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (bookmarked != null) {
      return bookmarked(this);
    }
    return orElse();
  }
}

abstract class SpeakersBookmarkedState implements SpeakersState {
  const factory SpeakersBookmarkedState(final bool bookmarked) =
      _$SpeakersBookmarkedStateImpl;

  bool get bookmarked;

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeakersBookmarkedStateImplCopyWith<_$SpeakersBookmarkedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpeakersFailureStateImplCopyWith<$Res> {
  factory _$$SpeakersFailureStateImplCopyWith(_$SpeakersFailureStateImpl value,
          $Res Function(_$SpeakersFailureStateImpl) then) =
      __$$SpeakersFailureStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedback});
}

/// @nodoc
class __$$SpeakersFailureStateImplCopyWithImpl<$Res>
    extends _$SpeakersStateCopyWithImpl<$Res, _$SpeakersFailureStateImpl>
    implements _$$SpeakersFailureStateImplCopyWith<$Res> {
  __$$SpeakersFailureStateImplCopyWithImpl(_$SpeakersFailureStateImpl _value,
      $Res Function(_$SpeakersFailureStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = null,
  }) {
    return _then(_$SpeakersFailureStateImpl(
      null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SpeakersFailureStateImpl implements SpeakersFailureState {
  const _$SpeakersFailureStateImpl(this.feedback);

  @override
  final String feedback;

  @override
  String toString() {
    return 'SpeakersState.failure(feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeakersFailureStateImpl &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback);

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeakersFailureStateImplCopyWith<_$SpeakersFailureStateImpl>
      get copyWith =>
          __$$SpeakersFailureStateImplCopyWithImpl<_$SpeakersFailureStateImpl>(
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
    required TResult Function(_SpeakersState value) initial,
    required TResult Function(SpeakersLoadedState value) loaded,
    required TResult Function(SpeakersProgressState value) progress,
    required TResult Function(SpeakersSuccessState value) success,
    required TResult Function(SpeakersFetchedState value) fetched,
    required TResult Function(SpeakersBookmarkedState value) bookmarked,
    required TResult Function(SpeakersFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SpeakersState value)? initial,
    TResult? Function(SpeakersLoadedState value)? loaded,
    TResult? Function(SpeakersProgressState value)? progress,
    TResult? Function(SpeakersSuccessState value)? success,
    TResult? Function(SpeakersFetchedState value)? fetched,
    TResult? Function(SpeakersBookmarkedState value)? bookmarked,
    TResult? Function(SpeakersFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SpeakersState value)? initial,
    TResult Function(SpeakersLoadedState value)? loaded,
    TResult Function(SpeakersProgressState value)? progress,
    TResult Function(SpeakersSuccessState value)? success,
    TResult Function(SpeakersFetchedState value)? fetched,
    TResult Function(SpeakersBookmarkedState value)? bookmarked,
    TResult Function(SpeakersFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class SpeakersFailureState implements SpeakersState {
  const factory SpeakersFailureState(final String feedback) =
      _$SpeakersFailureStateImpl;

  String get feedback;

  /// Create a copy of SpeakersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeakersFailureStateImplCopyWith<_$SpeakersFailureStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
