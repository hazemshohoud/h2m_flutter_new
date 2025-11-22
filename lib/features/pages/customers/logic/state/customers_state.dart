part of '../cubit/customers_cubit.dart';

@freezed
class CustomersState<T> with _$CustomersState<T> {
  const factory CustomersState.initial() = _Initial;
  const factory CustomersState.loading() = Loading;
  const factory CustomersState.success(T data) = Success<T>;
  const factory CustomersState.error({required String error}) = Error;
}
