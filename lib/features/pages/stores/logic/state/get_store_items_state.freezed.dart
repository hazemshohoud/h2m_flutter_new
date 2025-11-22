// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_store_items_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetStoreItemsState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetStoreItemsState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetStoreItemsState<$T>()';
  }
}

/// @nodoc
class $GetStoreItemsStateCopyWith<T, $Res> {
  $GetStoreItemsStateCopyWith(
      GetStoreItemsState<T> _, $Res Function(GetStoreItemsState<T>) __);
}

/// Adds pattern-matching-related methods to [GetStoreItemsState].
extension GetStoreItemsStatePatterns<T> on GetStoreItemsState<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(StoreItemsStateLoading<T> value)? loading,
    TResult Function(StoreItemsStateSuccess<T> value)? success,
    TResult Function(StoreItemsStateError<T> value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case StoreItemsStateLoading() when loading != null:
        return loading(_that);
      case StoreItemsStateSuccess() when success != null:
        return success(_that);
      case StoreItemsStateError() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(StoreItemsStateLoading<T> value) loading,
    required TResult Function(StoreItemsStateSuccess<T> value) success,
    required TResult Function(StoreItemsStateError<T> value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case StoreItemsStateLoading():
        return loading(_that);
      case StoreItemsStateSuccess():
        return success(_that);
      case StoreItemsStateError():
        return error(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(StoreItemsStateLoading<T> value)? loading,
    TResult? Function(StoreItemsStateSuccess<T> value)? success,
    TResult? Function(StoreItemsStateError<T> value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case StoreItemsStateLoading() when loading != null:
        return loading(_that);
      case StoreItemsStateSuccess() when success != null:
        return success(_that);
      case StoreItemsStateError() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case StoreItemsStateLoading() when loading != null:
        return loading();
      case StoreItemsStateSuccess() when success != null:
        return success(_that.data);
      case StoreItemsStateError() when error != null:
        return error(_that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String error) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case StoreItemsStateLoading():
        return loading();
      case StoreItemsStateSuccess():
        return success(_that.data);
      case StoreItemsStateError():
        return error(_that.error);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String error)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case StoreItemsStateLoading() when loading != null:
        return loading();
      case StoreItemsStateSuccess() when success != null:
        return success(_that.data);
      case StoreItemsStateError() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements GetStoreItemsState<T> {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetStoreItemsState<$T>.initial()';
  }
}

/// @nodoc

class StoreItemsStateLoading<T> implements GetStoreItemsState<T> {
  const StoreItemsStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoreItemsStateLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetStoreItemsState<$T>.loading()';
  }
}

/// @nodoc

class StoreItemsStateSuccess<T> implements GetStoreItemsState<T> {
  const StoreItemsStateSuccess(this.data);

  final T data;

  /// Create a copy of GetStoreItemsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoreItemsStateSuccessCopyWith<T, StoreItemsStateSuccess<T>> get copyWith =>
      _$StoreItemsStateSuccessCopyWithImpl<T, StoreItemsStateSuccess<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoreItemsStateSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'GetStoreItemsState<$T>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $StoreItemsStateSuccessCopyWith<T, $Res>
    implements $GetStoreItemsStateCopyWith<T, $Res> {
  factory $StoreItemsStateSuccessCopyWith(StoreItemsStateSuccess<T> value,
          $Res Function(StoreItemsStateSuccess<T>) _then) =
      _$StoreItemsStateSuccessCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$StoreItemsStateSuccessCopyWithImpl<T, $Res>
    implements $StoreItemsStateSuccessCopyWith<T, $Res> {
  _$StoreItemsStateSuccessCopyWithImpl(this._self, this._then);

  final StoreItemsStateSuccess<T> _self;
  final $Res Function(StoreItemsStateSuccess<T>) _then;

  /// Create a copy of GetStoreItemsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(StoreItemsStateSuccess<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class StoreItemsStateError<T> implements GetStoreItemsState<T> {
  const StoreItemsStateError({required this.error});

  final String error;

  /// Create a copy of GetStoreItemsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StoreItemsStateErrorCopyWith<T, StoreItemsStateError<T>> get copyWith =>
      _$StoreItemsStateErrorCopyWithImpl<T, StoreItemsStateError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StoreItemsStateError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'GetStoreItemsState<$T>.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class $StoreItemsStateErrorCopyWith<T, $Res>
    implements $GetStoreItemsStateCopyWith<T, $Res> {
  factory $StoreItemsStateErrorCopyWith(StoreItemsStateError<T> value,
          $Res Function(StoreItemsStateError<T>) _then) =
      _$StoreItemsStateErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$StoreItemsStateErrorCopyWithImpl<T, $Res>
    implements $StoreItemsStateErrorCopyWith<T, $Res> {
  _$StoreItemsStateErrorCopyWithImpl(this._self, this._then);

  final StoreItemsStateError<T> _self;
  final $Res Function(StoreItemsStateError<T>) _then;

  /// Create a copy of GetStoreItemsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(StoreItemsStateError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
