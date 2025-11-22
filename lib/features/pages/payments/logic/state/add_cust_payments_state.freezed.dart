// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_cust_payments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddCustPaymentsState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddCustPaymentsState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddCustPaymentsState<$T>()';
  }
}

/// @nodoc
class $AddCustPaymentsStateCopyWith<T, $Res> {
  $AddCustPaymentsStateCopyWith(
      AddCustPaymentsState<T> _, $Res Function(AddCustPaymentsState<T>) __);
}

/// Adds pattern-matching-related methods to [AddCustPaymentsState].
extension AddCustPaymentsStatePatterns<T> on AddCustPaymentsState<T> {
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
    TResult Function(CustPaymentsStateLoading<T> value)? loading,
    TResult Function(CustPaymentsStateSuccess<T> value)? success,
    TResult Function(CustPaymentsStateError<T> value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case CustPaymentsStateLoading() when loading != null:
        return loading(_that);
      case CustPaymentsStateSuccess() when success != null:
        return success(_that);
      case CustPaymentsStateError() when error != null:
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
    required TResult Function(CustPaymentsStateLoading<T> value) loading,
    required TResult Function(CustPaymentsStateSuccess<T> value) success,
    required TResult Function(CustPaymentsStateError<T> value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case CustPaymentsStateLoading():
        return loading(_that);
      case CustPaymentsStateSuccess():
        return success(_that);
      case CustPaymentsStateError():
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
    TResult? Function(CustPaymentsStateLoading<T> value)? loading,
    TResult? Function(CustPaymentsStateSuccess<T> value)? success,
    TResult? Function(CustPaymentsStateError<T> value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case CustPaymentsStateLoading() when loading != null:
        return loading(_that);
      case CustPaymentsStateSuccess() when success != null:
        return success(_that);
      case CustPaymentsStateError() when error != null:
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
      case CustPaymentsStateLoading() when loading != null:
        return loading();
      case CustPaymentsStateSuccess() when success != null:
        return success(_that.data);
      case CustPaymentsStateError() when error != null:
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
      case CustPaymentsStateLoading():
        return loading();
      case CustPaymentsStateSuccess():
        return success(_that.data);
      case CustPaymentsStateError():
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
      case CustPaymentsStateLoading() when loading != null:
        return loading();
      case CustPaymentsStateSuccess() when success != null:
        return success(_that.data);
      case CustPaymentsStateError() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements AddCustPaymentsState<T> {
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
    return 'AddCustPaymentsState<$T>.initial()';
  }
}

/// @nodoc

class CustPaymentsStateLoading<T> implements AddCustPaymentsState<T> {
  const CustPaymentsStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustPaymentsStateLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddCustPaymentsState<$T>.loading()';
  }
}

/// @nodoc

class CustPaymentsStateSuccess<T> implements AddCustPaymentsState<T> {
  const CustPaymentsStateSuccess(this.data);

  final T data;

  /// Create a copy of AddCustPaymentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustPaymentsStateSuccessCopyWith<T, CustPaymentsStateSuccess<T>>
      get copyWith => _$CustPaymentsStateSuccessCopyWithImpl<T,
          CustPaymentsStateSuccess<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustPaymentsStateSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'AddCustPaymentsState<$T>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $CustPaymentsStateSuccessCopyWith<T, $Res>
    implements $AddCustPaymentsStateCopyWith<T, $Res> {
  factory $CustPaymentsStateSuccessCopyWith(CustPaymentsStateSuccess<T> value,
          $Res Function(CustPaymentsStateSuccess<T>) _then) =
      _$CustPaymentsStateSuccessCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$CustPaymentsStateSuccessCopyWithImpl<T, $Res>
    implements $CustPaymentsStateSuccessCopyWith<T, $Res> {
  _$CustPaymentsStateSuccessCopyWithImpl(this._self, this._then);

  final CustPaymentsStateSuccess<T> _self;
  final $Res Function(CustPaymentsStateSuccess<T>) _then;

  /// Create a copy of AddCustPaymentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(CustPaymentsStateSuccess<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class CustPaymentsStateError<T> implements AddCustPaymentsState<T> {
  const CustPaymentsStateError({required this.error});

  final String error;

  /// Create a copy of AddCustPaymentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustPaymentsStateErrorCopyWith<T, CustPaymentsStateError<T>> get copyWith =>
      _$CustPaymentsStateErrorCopyWithImpl<T, CustPaymentsStateError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustPaymentsStateError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'AddCustPaymentsState<$T>.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class $CustPaymentsStateErrorCopyWith<T, $Res>
    implements $AddCustPaymentsStateCopyWith<T, $Res> {
  factory $CustPaymentsStateErrorCopyWith(CustPaymentsStateError<T> value,
          $Res Function(CustPaymentsStateError<T>) _then) =
      _$CustPaymentsStateErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$CustPaymentsStateErrorCopyWithImpl<T, $Res>
    implements $CustPaymentsStateErrorCopyWith<T, $Res> {
  _$CustPaymentsStateErrorCopyWithImpl(this._self, this._then);

  final CustPaymentsStateError<T> _self;
  final $Res Function(CustPaymentsStateError<T>) _then;

  /// Create a copy of AddCustPaymentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(CustPaymentsStateError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
