import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_mandoben_state.freezed.dart';

@freezed
class GetmandobenState<T> with _$GetmandobenState<T> {
  const factory GetmandobenState.initial() = _Initial;
  const factory GetmandobenState.loading() = Loading;
  const factory GetmandobenState.success(T data) = Success<T>;
  const factory GetmandobenState.error({required String error}) = Error;
}
