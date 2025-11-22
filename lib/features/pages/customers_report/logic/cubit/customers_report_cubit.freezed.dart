// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customers_report_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomersReportState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CustomersReportState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CustomersReportState<$T>()';
  }
}

/// @nodoc
class $CustomersReportStateCopyWith<T, $Res> {
  $CustomersReportStateCopyWith(
      CustomersReportState<T> _, $Res Function(CustomersReportState<T>) __);
}

/// Adds pattern-matching-related methods to [CustomersReportState].
extension CustomersReportStatePatterns<T> on CustomersReportState<T> {
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
    TResult Function(CustomersReportStateLoading<T> value)? loading,
    TResult Function(CustomersReportStateSuccess<T> value)? success,
    TResult Function(CustomersReportStateError<T> value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case CustomersReportStateLoading() when loading != null:
        return loading(_that);
      case CustomersReportStateSuccess() when success != null:
        return success(_that);
      case CustomersReportStateError() when error != null:
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
    required TResult Function(CustomersReportStateLoading<T> value) loading,
    required TResult Function(CustomersReportStateSuccess<T> value) success,
    required TResult Function(CustomersReportStateError<T> value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case CustomersReportStateLoading():
        return loading(_that);
      case CustomersReportStateSuccess():
        return success(_that);
      case CustomersReportStateError():
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
    TResult? Function(CustomersReportStateLoading<T> value)? loading,
    TResult? Function(CustomersReportStateSuccess<T> value)? success,
    TResult? Function(CustomersReportStateError<T> value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case CustomersReportStateLoading() when loading != null:
        return loading(_that);
      case CustomersReportStateSuccess() when success != null:
        return success(_that);
      case CustomersReportStateError() when error != null:
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
      case CustomersReportStateLoading() when loading != null:
        return loading();
      case CustomersReportStateSuccess() when success != null:
        return success(_that.data);
      case CustomersReportStateError() when error != null:
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
      case CustomersReportStateLoading():
        return loading();
      case CustomersReportStateSuccess():
        return success(_that.data);
      case CustomersReportStateError():
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
      case CustomersReportStateLoading() when loading != null:
        return loading();
      case CustomersReportStateSuccess() when success != null:
        return success(_that.data);
      case CustomersReportStateError() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements CustomersReportState<T> {
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
    return 'CustomersReportState<$T>.initial()';
  }
}

/// @nodoc

class CustomersReportStateLoading<T> implements CustomersReportState<T> {
  const CustomersReportStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersReportStateLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CustomersReportState<$T>.loading()';
  }
}

/// @nodoc

class CustomersReportStateSuccess<T> implements CustomersReportState<T> {
  const CustomersReportStateSuccess(this.data);

  final T data;

  /// Create a copy of CustomersReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersReportStateSuccessCopyWith<T, CustomersReportStateSuccess<T>>
      get copyWith => _$CustomersReportStateSuccessCopyWithImpl<T,
          CustomersReportStateSuccess<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersReportStateSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'CustomersReportState<$T>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $CustomersReportStateSuccessCopyWith<T, $Res>
    implements $CustomersReportStateCopyWith<T, $Res> {
  factory $CustomersReportStateSuccessCopyWith(
          CustomersReportStateSuccess<T> value,
          $Res Function(CustomersReportStateSuccess<T>) _then) =
      _$CustomersReportStateSuccessCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$CustomersReportStateSuccessCopyWithImpl<T, $Res>
    implements $CustomersReportStateSuccessCopyWith<T, $Res> {
  _$CustomersReportStateSuccessCopyWithImpl(this._self, this._then);

  final CustomersReportStateSuccess<T> _self;
  final $Res Function(CustomersReportStateSuccess<T>) _then;

  /// Create a copy of CustomersReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(CustomersReportStateSuccess<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class CustomersReportStateError<T> implements CustomersReportState<T> {
  const CustomersReportStateError({required this.error});

  final String error;

  /// Create a copy of CustomersReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomersReportStateErrorCopyWith<T, CustomersReportStateError<T>>
      get copyWith => _$CustomersReportStateErrorCopyWithImpl<T,
          CustomersReportStateError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomersReportStateError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'CustomersReportState<$T>.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class $CustomersReportStateErrorCopyWith<T, $Res>
    implements $CustomersReportStateCopyWith<T, $Res> {
  factory $CustomersReportStateErrorCopyWith(CustomersReportStateError<T> value,
          $Res Function(CustomersReportStateError<T>) _then) =
      _$CustomersReportStateErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$CustomersReportStateErrorCopyWithImpl<T, $Res>
    implements $CustomersReportStateErrorCopyWith<T, $Res> {
  _$CustomersReportStateErrorCopyWithImpl(this._self, this._then);

  final CustomersReportStateError<T> _self;
  final $Res Function(CustomersReportStateError<T>) _then;

  /// Create a copy of CustomersReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(CustomersReportStateError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
