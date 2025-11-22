import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_store_items_state.freezed.dart';

@freezed
class GetStoreItemsState<T> with _$GetStoreItemsState<T> {
  const factory GetStoreItemsState.initial() = _Initial;
  const factory GetStoreItemsState.loading() = StoreItemsStateLoading;
  const factory GetStoreItemsState.success(T data) = StoreItemsStateSuccess<T>;
  const factory GetStoreItemsState.error({required String error}) =
      StoreItemsStateError;
}
