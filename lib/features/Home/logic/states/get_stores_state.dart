import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_stores_state.freezed.dart';

@freezed
class GetStoresState<T> with _$GetStoresState<T> {
  const factory GetStoresState.initial() = _Initial;
  const factory GetStoresState.loading() = Loading;
  const factory GetStoresState.success(T data) = Success<T>;
  const factory GetStoresState.error({required String error}) = Error;
}
