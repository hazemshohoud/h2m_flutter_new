part of 'get_items_cubit.dart';

@freezed
abstract class GetItemsState<T> with _$GetItemsState<T> {
  const factory GetItemsState.initial() = _Initial;
  const factory GetItemsState.loading() = _Loading;
  const factory GetItemsState.success(List<dynamic> response) = _Success;
  const factory GetItemsState.error({required String error}) = _Error;
}