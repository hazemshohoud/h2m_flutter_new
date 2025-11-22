part of '../cubit/order_add_cubit.dart';

@freezed
abstract class OrderAddState<T> with _$OrderAddState<T> {
  const factory OrderAddState.initial() = _Initial;
  const factory OrderAddState.loading() = Loading;
  const factory OrderAddState.success(String response) = Success;
  const factory OrderAddState.error({required String error}) = _Error;
}